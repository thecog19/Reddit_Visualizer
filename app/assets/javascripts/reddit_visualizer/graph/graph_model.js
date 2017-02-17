'use strict';

var GRAPH = GRAPH || {};

GRAPH.model = (function(d3) {

  var _config;
  var _graphData = {};
  var init = function init(config) {
    _config = config;
    // make initial json call w/ route builder
    var route = _jsonRoute(_config.json.rootId);
    _setRootData(route)
    return _graphData
  }

  var update = function update() {
    // set up node and link data
    graphData.nodes = _flatten(_graphData.root);
    graphData.links = d3.layout.tree().links(graphData.nodes);
    
    // set domains for scales  
    _setScaleDomains()
    // return root node and scales(?)
  }

  var _jsonRoute = function _jsonRoute(id) {
    return _config.json.base + id + _config.json.suffix;
  };

  var _setRootData = function _setRootData(route){
    d3.json(route, function(error, json) {
    // /api/v1/subreddits/1.json
    if (error) throw error;
      _graphData.root = json;
      update();
    });
  };

  var _setScaleDomains = function _setScaleDomains() {
    var scales = _config.viewData.scales;
    var options = _config.scales;
    scales.radius.domain(
      d3.extent(_nodes, function(d) {
        return d[options.radius.accessor]
      })
    );

    scales.color.domain(
      d3.extent(_nodes, function(d) {
        return d[options.color.accessor]
      })
    );

    scales.weight.domain(
      d3.extent(_nodes, function(d) {
        return d[options.weight.accessor]
      })
    );
  }

  var _flatten = function _flatten(root) {
    var nodes = [], i = 0;
    var recurse = function recurse(node) {
      // TODO dependency on a 'children' attr
      if (node.children) node.children.forEach(recurse);
      if (!node.id) node.id = ++i;
      nodes.push(node);

    }
    // Starting with the root
    recurse(root);
    return nodes;
  };

  return {
    init: init,
    update: update
  }
}(d3));