'use strict';

var RV = RV || {};

RV.graph = function() {
  var options
  var d3Selectors = {}
  var config

  var initialize = function(configObj){
    config = configObj
    options = {
      width: config.width || 1200,
      height: config.height || 600,
      // force
      linkDistance: config.linkDistance || 50,
      linkStrength: config.linkStrength || 1.0,
      charge: config.charge || -30,
      gravity: config.gravity || .01,
      friction: config.friction || 0.9,
      // scales
      // # TODO handle undefined keys from config?
      scales: {
        radius: {
          min: config.scales.radius.min,
          max: config.scales.radius.max,
          accessor: config.scales.radius.accessor
        },
        color: {
          min: config.scales.color.min,
          max: config.scales.color.max,
          accessor: config.scales.color.accessor
        },
        connection_weight: {
          min: config.scales.connection_weight.min,
          max: config.scales.connection_weight.max,
          accessor: config.scales.connection_weight.accessor
        }
      },
      rootId: config.json.rootId,
      nodes: undefined,
      links: undefined,
      root: undefined
    }

    clearSvg();

    d3Selectors = {
      force: initializeForce(),
      svg: svg(),
      rScale: initializeRScale(options.scales.radius),
      colScale: initializeColScale(options.scales.color),
      weightScale: initializeWeightScale(options.scales.connection_weight),
    }
    d3Selectors.node = node()
    d3Selectors.link = link()
    getRootNode()

  }
  
  var clearSvg = function clearSvg() {
    d3.select(config.container).selectAll('svg').remove();
  };

   // Build json request route
   var jsonRoute = function jsonRoute(id) {
    return config.json.base + id + config.json.suffix;
  };

  var svg = function(){

    return d3.select(config.container).append('svg')
    .attr('width', options.width)
    .attr('height', options.height);
  }

  var initializeForce = function(){
   return d3.layout.force()
    .linkDistance(options.linkDistance)
    .linkStrength(options.linkStrength)
    .charge(options.charge)
    .gravity(options.gravity)
    .friction(options.friction)
    .size([options.width, options.height]);
  }


  var initializeRScale = function(radius){
    return d3.scale.sqrt().range([radius.min, radius.max]);
  }

  var initializeColScale =  function(color){
    return d3.scale.log().range([color.min, color.max]);
  }

  var initializeWeightScale = function(connection_weight){
    return d3.scale.log().range([connection_weight.min, connection_weight.max]);
  }

  var link = function(){
    return d3Selectors.svg.selectAll('.link')
  }

  var node = function(){
    return d3Selectors.svg.selectAll('.node');
  }

  var getRootNode = function(){
    d3.json(jsonRoute(options.rootId), function(error, json) {
    // /api/v1/subreddits/1.json
    if (error) throw error;
      options.root = json;
      update(options.root)
    })
  }

  var update = function update(root) {
    // Format data for use in force.start()
    options.nodes = flatten(root),

    // 'nodes' must have a 'children' attr
    options.links = d3.layout.tree().links(options.nodes);
    // console.log(links);

    // Feed the force layout current nodes and links.
    d3Selectors.force
      .nodes(options.nodes)
      .links(options.links)
      .on("tick", tick)
      .start();

    // Convert data numbers into our graph scales
    d3Selectors.rScale.domain(
      d3.extent(options.nodes, function(d)
        {
          return d[options.scales.radius.accessor];
        }));
    d3Selectors.colScale.domain(
      d3.extent(options.nodes, function(d)
        {
          return d[options.scales.color.accessor];
        }));

    // Bind links data to all '.link' elements in canvas.
    d3Selectors.link = d3Selectors.link.data(options.links, function(d) {
      // Keep binding consistent by using the target's accessor.
      return d.target[config.json.accessor];
    });
    d3Selectors.link.exit().remove();

    // Add new data nodes and connecting lines to canvas
     d3Selectors.link.enter().insert('line', '.node')
      .attr('class', 'link')
      .attr('stroke-width', function(d) {
        return d3Selectors.weightScale(d.target[options.scales.connection_weight.accessor])
      });
    d3Selectors.node = d3Selectors.node.data(options.nodes, function(d) { return d[config.json.accessor]; });
    d3Selectors.node.exit().remove();

    // Because nodes contain both circles and text, we will bind each object in 'nodes' to a <g> element (like a generic <div> container but for svg).
    var nodeEnter = d3Selectors.node.enter().append('g')
      .attr('class', 'node')
      .on('click', function(d) {
        expand(d);
        config.nodeClickHandlers.forEach(function(callback) {
          callback(d);
        })
      })
      .call(d3Selectors.force.drag);
    // Add a color/radius scaled circle to our <g> container.
    nodeEnter.append('circle')
      .attr('r', function(d) { return d3Selectors.rScale(d[options.scales.radius.accessor]); })
      .style('fill', function(d) { return d3Selectors.colScale(d[options.scales.color.accessor]); });

    // Add a text element to the <g>.
    nodeEnter.append('text')
      .attr('dx', 12)
      .attr('dy', '.35em')
      .style('font-size', '1em')
      // TODO? change name to an accessor
      .text(function(d) { return d.name; });
  };

  var tick = function tick() {
    // Sort our nodes into a quadtree (https://github.com/d3/d3-3.x-api-reference/blob/master/Quadtree-Geom.md)
    var qTree = d3.geom.quadtree(options.nodes);

    options.nodes.forEach(function(node) {
      // Run every node in the quadtree through the callback returned by collide(node).
      qTree.visit(collide(node));
    });

    // Redraw lines
    d3Selectors.link.attr('x1', function(d) { return d.source.x; })
        .attr('y1', function(d) { return d.source.y; })
        .attr('x2', function(d) { return d.target.x; })
        .attr('y2', function(d) { return d.target.y; });

    // Redraw nodes
    d3Selectors.node.attr('transform', function(d) {
      return 'translate(' + d.x + ',' + d.y + ')';
    });
  };

  var expand = function expand(d) {
    // Clicking to drag - d3 prevents default, allows node dragging without expansion
    if(d3.event.defaultPrevented) return;
    // If expanded...
    if(d.children) {
      // Hide children in _children.
      d._children = d.children;
      d.children = null;
    }
    // If hidden children are cached...
    else if (d._children) {
      // Show hidden children.
      d.children = d._children;
      d._children = null;
    }
    // If no children exist...
    else {
      // Fetch children. Here I'm using a file named after the ID, this will of course be an AJAX request to our API.
      d3.json(jsonRoute(d[config.json.accessor]), function(error, json) {
        if (error) throw error;
        // TODO dependency on 'children' - JSON response must contain 'children' attr
        d.children = uniqueChildren(json.children);
        // Update needs to be called within the callback so that we know the new data is ready.
        update(options.root);
      });
    }
    update(options.root);
  };


  var uniqueChildren = function(children){
    // TODO less iteration
    for (var j = children.length - 1; j >= 0; j--) {
      var child = children[j]
      for(var i = 0; i < options.nodes.length; i++){
        if(options.nodes[i].id === child.id){
          children.splice(j, 1)
        }
      }
    }
    return children
  }

  var flatten = function flatten(root) {
    var nodes = [], i = 0;
    // Keep adding each node's children to the flat array as long as children are present
    var recurse = function recurse(node) {
      // TODO dependency on a 'children' attr
      //the reason this breaks is because the node with children
      //is the node that gets excluded by check_if_exists
      if (node.children) node.children.forEach(recurse);
      if (!node.id) node.id = ++i;
      nodes.push(node);

    }
    // Starting with the root
    recurse(root);
    return nodes;
  };

  var collide = function collide(dataNode) {
    // Define the bounds of the given node.
    var radius = d3Selectors.rScale(dataNode[options.scales.radius.accessor]),
        dataX1 = dataNode.x - options.radius,
        dataX2 = dataNode.x + options.radius,
        dataY1 = dataNode.y - options.radius,
        dataY2 = dataNode.y + options.radius;
    // This callback takes the node of the quadtree and its bounds.
    return function(quad, treeX1, treeY1, treeX2, treeY2) {
      var treeNode = quad.point;
      // console.log(treeNode)
      if (treeNode && (treeNode[config.json.accessor] !== dataNode[config.json.accessor])) {
        // Calculate the distance between the two nodes.
        var absXLength = dataNode.x - treeNode.x,
            absYLength = dataNode.y - treeNode.y,
            // Pythagoras!
            distance = Math.sqrt(absXLength * absXLength + absYLength * absYLength),
            // Add radii together to find the minimum distance apart the nodes can be without colliding.
            min = radius + d3Selectors.rScale(treeNode[options.scales.radius.accessor]);

        // If nodes collide...
        if (distance < min) {
          // Find the amount of overlap and adjust each node half that distance.
          var adjustment = (distance - min) / distance * .5;
          var xAdjustment = absXLength * adjustment;
          // TODO should be absYLength?
          var yAdjustment = absXLength * adjustment;
          dataNode.x -= xAdjustment;
          dataNode.y -= yAdjustment;
          treeNode.x += xAdjustment;
          treeNode.y += yAdjustment;
        }
      }

      // Return true if no part of the dataNode is inside of the treeNode. If this callback returns true, none of the current treeNode's children are visited.
      return treeX1 > dataX2 ||
             treeX2 < dataX1 ||
             treeY1 > dataY2 ||
             treeY2 < dataY1;
    };
  };


  return {
    initialize: initialize,
    jsonRoute: jsonRoute
  }
}
