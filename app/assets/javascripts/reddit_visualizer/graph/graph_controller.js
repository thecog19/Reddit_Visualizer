'use strict';

var GRAPH = GRAPH || {};

GRAPH.controller = (function(model, view, d3) {

  var init = function(config) {
    // init the model
    var viewData, graphData;

    viewData = view.init(config, _callbacks);
    config.viewData = viewData;

    graphData = model.init(config).then(function(graphData) {
      view.update(graphData);
    });
    // init the view w/ the model response
  };

  var _tick = function _tick() {
    // nodes, links = model.tick
    // view.tick(nodes, links)

    // Sort our nodes into a quadtree (https://github.com/d3/d3-3.x-api-reference/blob/master/Quadtree-Geom.md)
    model.checkCollision();

    // FEB17 left off
    view.redraw();
  };

  var _expand = function _expand() {

  };

  var _callbacks = {
    tick: _tick,
    expand: _expand
  };

  return {
    init: init
  };
}(GRAPH.model, GRAPH.view, d3));
