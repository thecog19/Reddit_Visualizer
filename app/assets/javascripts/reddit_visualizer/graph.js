'use strict';

var RV = RV || {};

RV.graph = function(config) {

  // Init opts
  var width = config.width,
    height = config.height,
    // force
    linkDistance = config.linkDistance || 150,
    linkStrength = config.linkStrength || .8,
    charge = config.charge || -100,
    gravity = config.gravity || .05,
    // scales
    // # TODO handle undefined keys from config?
    scales = {
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
    rootId = config.json.rootId,
    nodes,
    links,
    root;

  // Build json request route
  var jsonRoute = function jsonRoute(id) {
    return config.json.base + id + config.json.suffix;
  };

  var svg = d3.select(config.container).append('svg')
    .attr('width', width)
    .attr('height', height);

  // console.log(svg);
  // Configure force settings to adjust physics interaction between nodes.
  var force = d3.layout.force()
    .linkDistance(linkDistance)
    .linkStrength(linkStrength)
    .charge(charge)
    .gravity(gravity)
    .size([width, height]);

  // Configure scales
  var rScale = d3.scale.sqrt().range([scales.radius.min, scales.radius.max]);
  var colScale = d3.scale.log().range([scales.color.min, scales.color.max]);
  var weightScale = d3.scale.log().range([scales.connection_weight.min, scales.connection_weight.max]);

  // SelectAll links and nodes
  var link = svg.selectAll('.link'),
      node = svg.selectAll('.node');

  d3.json(jsonRoute(rootId), function(error, json) {
    console.log(json);
    // /api/v1/subreddits/1.json
    if (error) throw error;
    root = json;

    update();
  });

  var update = function update() {
    // Format data for use in force.start()
    nodes = flatten(root),

    // 'nodes' must have a 'children' attr
    links = d3.layout.tree().links(nodes);
    // console.log(links);

    // Feed the force layout current nodes and links.
    force
      .nodes(nodes)
      .links(links)
      .on("tick", tick)
      .start();

    // Convert data numbers into our graph scales
    rScale.domain(d3.extent(nodes, function(d) { return d[scales.radius.accessor]; }));
    colScale.domain(d3.extent(nodes, function(d) { return d[scales.color.accessor]; }));

    // Bind links data to all '.link' elements in canvas.
    link = link.data(links, function(d) {
      // Keep binding consistent by using the target's accessor.
      return d.target[config.json.accessor];
    });
    link.exit().remove();

    // Add new data nodes and connecting lines to canvas
    link.enter().insert('line', '.node')
      .attr('class', 'link')
      .attr('stroke-width', function(d) {
        return weightScale(d.target[scales.connection_weight.accessor])
      });
    node = node.data(nodes, function(d) { return d[config.json.accessor]; });
    node.exit().remove();

    // Because nodes contain both circles and text, we will bind each object in 'nodes' to a <g> element (like a generic <div> container but for svg).
    var nodeEnter = node.enter().append('g')
      .attr('class', 'node')
      .on('click', expand)
      .call(force.drag);

    // Add a color/radius scaled circle to our <g> container.
    nodeEnter.append('circle')
      .attr('r', function(d) { return rScale(d[scales.radius.accessor]); })
      .style('fill', function(d) { return colScale(d[scales.color.accessor]); });

    // Add a text element to the <g>.
    nodeEnter.append('text')
      .attr('dx', 12)
      .attr('dy', '.35em')
      .style('font-size', '1em')
      // TODO? change name to an accessor
      .text(function(d) { return d.name; });
  };

  // Called repeatedly as long as nodes/links are moving.
  var tick = function tick() {
    // Sort our nodes into a quadtree (https://github.com/d3/d3-3.x-api-reference/blob/master/Quadtree-Geom.md)
    var qTree = d3.geom.quadtree(nodes);

    nodes.forEach(function(node) {
      // Run every node in the quadtree through the callback returned by collide(node).
      qTree.visit(collide(node));
    });

    // Redraw lines
    link.attr('x1', function(d) { return d.source.x; })
        .attr('y1', function(d) { return d.source.y; })
        .attr('x2', function(d) { return d.target.x; })
        .attr('y2', function(d) { return d.target.y; });

    // Redraw nodes
    node.attr('transform', function(d) {
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
        update();
      });
    }
    update();
  };

  var uniqueChildren = function(children){
    //this may be the cause of severe brakage
    //like. severe severe
    //the tldr is this fuction is supposed to stop cousin nodes
    //from appearing
    //however, we also have a bad case of ghost nodes
    //which is lovely
    for(var j = children.length; j < 0; j--){ 
      var child = children[j]
      for(var i = 0; i < nodes.length; i++){
             if(nodes[i].id === child.id){
               children.slice(j, 1)
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
    var radius = rScale(dataNode[scales.radius.accessor]),
        dataX1 = dataNode.x - radius,
        dataX2 = dataNode.x + radius,
        dataY1 = dataNode.y - radius,
        dataY2 = dataNode.y + radius;
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
            min = radius + rScale(treeNode[scales.radius.accessor]);

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

  return {jsonRoute: jsonRoute,
          update: update,
          root: root}
};
