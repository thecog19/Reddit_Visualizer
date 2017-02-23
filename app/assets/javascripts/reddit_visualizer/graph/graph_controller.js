'use strict';

var GRAPH = GRAPH || {};

GRAPH.controller = (function(model, view, d3) {

  var _tick = function _tick() {
    model.checkCollision();

    view.redraw();
  };

  var _toggleChildren = function _toggleChildren(d) {
    return model.toggleChildren(d).then(view.update);
  };

  var _callbacks = {
    tick: _tick,
    toggleChildren: _toggleChildren,
  };

  var init = function(config, path = false) {
    var viewData, graphData;

    _callbacks.nodeClickHandlers = config.nodeClickHandlers;

    viewData = view.init(config, _callbacks);
    config.viewData = viewData;

    if(!!path){
      graphData = model.init(config, path["subreddits"].shift())
      view.update(graphData);
      view.clickOnChildren(path["subreddits"]) 

    }else{
      graphData = model.init(config).then(function(graphData) {
        view.update(graphData);
      });
    }
  };

  var expandChildren = function(){
    return model.expandChildren().then(function(r) {
      view.update(r)
    })
  }

  return {
    init: init,
    expandChildren: expandChildren
  };
}(GRAPH.model, GRAPH.view, d3));
