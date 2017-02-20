'use strict';

var GRAPH = GRAPH || {};

GRAPH.controller = (function(model, view, d3) {

  var _tick = function _tick() {
    // Sort our nodes into a quadtree (https://github.com/d3/d3-3.x-api-reference/blob/master/Quadtree-Geom.md)
    model.checkCollision();

    view.redraw();
  };

  var _toggleChildren = function _toggleChildren(d) {
    model.toggleChildren(d).then(view.update);
  };

  var _callbacks = {
    tick: _tick,
    toggleChildren: _toggleChildren,
  };

  var init = function(config) {
    // init the model
    var viewData, graphData;

    _callbacks.nodeClickHandlers = config.nodeClickHandlers;

    console.log(_callbacks);
    viewData = view.init(config, _callbacks);
    config.viewData = viewData;

    graphData = model.init(config).then(function(graphData) {
      view.update(graphData);
    });
    // init the view w/ the model response
  };

  return {
    init: init
  };
}(GRAPH.model, GRAPH.view, d3));
