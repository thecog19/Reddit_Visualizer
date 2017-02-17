'use strict';

var GRAPH = GRAPH || {};

GRAPH.controller = (function(model, view, d3) {

  var tick = function tick() {
    // nodes, links = model.tick 
    // view.tick(nodes, links)

    // Sort our nodes into a quadtree (https://github.com/d3/d3-3.x-api-reference/blob/master/Quadtree-Geom.md)
    var qTree = d3.geom.quadtree(options.nodes);

    options.nodes.forEach(function(node) {
      // Run every node in the quadtree through the callback returned by collide(node).
      qTree.visit(collide(node));
    });

    // Redraw lines
    d3Selectors.link
      .attr('x1', function(d) { return d.source.x; })
      .attr('y1', function(d) { return d.source.y; })
      .attr('x2', function(d) { return d.target.x; })
      .attr('y2', function(d) { return d.target.y; });

    // Redraw nodes
    d3Selectors.node.attr('transform', function(d) {
      return 'translate(' + d.x + ',' + d.y + ')';
    });
  };

  // var _callbacks = {
  //   tick: _tick,
  //   expand: _expand
  // }

  var init = function(config) {
    // init the model
    var viewData, graphData;
    viewData = view.init();
    config.viewData = viewData
    graphData = model.init(config);
    view.render(graphData);
    // init the view w/ the model response
  } 
   
  return {
    init: init
  }
}(GRAPH.model, GRAPH.view, d3));