'use strict';

var GRAPH = GRAPH || {};

GRAPH.model = (function(d3, scales) {

  var _config;
  var _graphData = {};

  var init = function init(config) {
    _config = config;
    // make initial json call w/ route builder
    var route = _jsonRoute(_config.json.rootId);
    scales.init(_config.scales);
    _graphData.scales = scales.getScales();
    return _setRootData(route);
  };

  var update = function update() {
    // set up node and link data
    _graphData.nodes = _flatten(_graphData.root);
    _graphData.links = d3.layout.tree().links(_graphData.nodes);
    scales.setScaleDomains(_graphData.nodes);
    // return root node and scales(?)
  };

  var _jsonRoute = function _jsonRoute(id) {
    return _config.json.base + id + _config.json.suffix;
  };

  var _setRootData = function _setRootData(route){
    return new Promise(function(resolve, reject) {
      d3.json(route, function(error, json) {
        if (error) throw error;
        _graphData.root = json;
        update();
        resolve(_graphData);
      });
    });
  };

  var _flatten = function _flatten(root) {
    var nodes = [], i = 0;
    var recurse = function recurse(node) {
      // TODO dependency on a 'children' attr
      if (node.children) node.children.forEach(recurse);
      if (!node.id) node.id = ++i;
      nodes.push(node);
    };
    // Starting with the root
    recurse(root);
    return nodes;
  };

  var checkCollision = function checkCollision() {
    var qTree = d3.geom.quadtree(_graphData.nodes);

    _graphData.nodes.forEach(function(node) {
      // Run every node in the quadtree through the callback returned by collide(node).
      qTree.visit(_collide(node));
    });
  };

  var _radiusOf = function _radiusOf(node) {
    return _graphData.scales.radius(node[_config.scales.radius.accessor]);
  };

  var _distanceBetween = function _distanceBetween(absXLength, absYLength) {
    return Math.sqrt(absXLength * absXLength + absYLength * absYLength);
  };

  var _adjustCollision = function _adjustCollision(treeNode, dataNode, adjustment, absXLength, absYLength) {
    var xAdjustment = absXLength * adjustment;
    var yAdjustment = absYLength * adjustment;

    dataNode.x -= xAdjustment;
    dataNode.y -= yAdjustment;
    treeNode.x += xAdjustment;
    treeNode.y += yAdjustment;
  };

  var _collide = function _collide(dataNode) {
    var radius = _radiusOf(dataNode),
        dataX1 = dataNode.x - radius,
        dataX2 = dataNode.x + radius,
        dataY1 = dataNode.y - radius,
        dataY2 = dataNode.y + radius;

    // This callback takes the node of the quadtree and its bounds.
    return function(quad, treeX1, treeY1, treeX2, treeY2) {
      var treeNode = quad.point;
      if (treeNode && (treeNode[_config.accessor] !== dataNode[_config.accessor])) {
        var absXLength = dataNode.x - treeNode.x,
            absYLength = dataNode.y - treeNode.y,
            distance = _distanceBetween(absXLength, absYLength),
            // Add radii together to find the minimum distance apart the nodes can be without colliding.
            min = radius + _radiusOf(treeNode);

        // If nodes collide...
        if (distance < min) {
          // Find the amount of overlap and adjust each node half that distance.
          if(distance === 0){
            var adjustment = 1
          }else{
            var adjustment = (distance - min) / distance * .5;
          }
          
          _adjustCollision(treeNode, dataNode, adjustment, absXLength, absYLength);
        }
      }

      // Return true if no part of the dataNode is inside of the treeNode. If this callback returns true, none of the current treeNode's children are visited.
      return treeX1 > dataX2 ||
             treeX2 < dataX1 ||
             treeY1 > dataY2 ||
             treeY2 < dataY1;
    };
  };

  var expandChildren = function(){
    return Promise.all(_generatePromises())
      .then(function(){return _graphData})
  }

  var _generatePromises = function(){
    return _graphData.nodes.map(function(node){
      if(node._children){
        _showChildren(node)
      } else if(!(node.children)){
        return _fetchChildren(node);
      }
      update();
      return new Promise(function(resolve, reject) {
        resolve(_graphData);
      })
    })
  }

  var _showChildren = function(d){
    d.children = d._children;
    d._children = null;  
  }

  var _hideChildren = function(d){
    d._children = d.children;
    d.children = null;
  }

  var toggleChildren = function toggleChildren(d) {
    if(d.children) {
      // Hide children in _children.
      _hideChildren(d)
    }
    else if (d._children) {
      // Show hidden children.
      _showChildren(d)
    } else {
      return _fetchChildren(d);
    }
    update();
    return new Promise(function(resolve, reject) {
      resolve(_graphData);
    });
  };

  var _fetchChildren = function _fetchChildren(d) {
    return new Promise(function(resolve, reject) {
      d3.json(_jsonRoute(d[_config.accessor]), function(error, json) {
        if (error) throw error;
        d.children = _uniqueChildren(json.children);
        update();
        resolve(_graphData);
      });
    });
  };

  var _uniqueChildren = function _uniqueChildren(children) {
    return children.filter(function(child) {
      for (var i = 0; i < _graphData.nodes.length; i++) {
        if (_graphData.nodes[i].id === child.id) {
          return false;
        }
      }
      return true;
    });
  };

  return {
    init: init,
    update: update,
    toggleChildren: toggleChildren,
    checkCollision: checkCollision,
    expandChildren: expandChildren,
    _setRootData: _setRootData
  };
}(d3, GRAPH.scales));
