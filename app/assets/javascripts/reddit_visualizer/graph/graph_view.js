'use strict';

var GRAPH = GRAPH || {};

GRAPH.view = (function(d3) {

  var _selectors = {};
  var _config;
  var _callbacks;
  var _force;
  var _container;
  var _viewData = {};
  var _graphData;

  var init = function init(config, callbacks) {
    // select inital dom elements
    var svg, zoom;
    _config = config;
    _callbacks = callbacks;
    _setForce();
    zoom = _zoomCallback();
    _clearSvg();
    svg = _setSvg(zoom);
    _setRect(svg);
    _container = _setContainer(svg);
    _viewData.links = _setLinks();
    _viewData.nodes = _setNodes();

    return _viewData;
  };

  var update = function update(graphData)  {
    _graphData = graphData;
    _bindNodes();
    _bindLinks();
    _linkEnter();
    _nodeEnter();
  };


  // FEB17 left off
  var redraw = function redraw() {
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

  var _bindNodes = function _bindNodes() {
    _viewData.nodes.data(_graphData.nodes, function(d) {
      return d[_config.accessor];
    });
    _viewData.node.exit().remove();
  };

  var _bindLinks = function _bindLinks() {
    _viewData.links.data(_graphData.links, function(d) {
      return d[_config.accessor];
    });
    _viewData.link.exit().remove();
  };

  var _linkEnter = function _linkEnter() {
    _viewData.links.enter().insert('line', '.node')
      .attr('class', 'link')
      .attr('stroke-width', function(d) {
        return _graphData.scales.weight(d.target[_config.scales.weight.accessor]);
      });
  };

  var _nodeEnter = function _nodeEnter() {
    var nodeEnter = _viewData.nodes.enter();

    _appendG(nodeEnter);
    _appendCircle(nodeEnter);
    _appendText(nodeEnter);

    nodeEnter
      .on('tick', _callbacks.tick);
  };

  var _appendG = function _appendG(nodeEnter) {
    nodeEnter.append('g')
      .attr('class', 'node')
      .on('click', function(d) {
        if(d3.event.defaultPrevented) return;
        _viewData.nodes.attr('class', 'node');
        this.classList += " active-d3-node";
        _callbacks.expand(d); // from callbacks
        config.nodeClickHandlers.forEach(function(callback) {
          callback(d);
        }); // from angular callback
      })
      .call(_force.drag);
    };

  var _appendCircle = function _appendCircle(nodeEnter) {
    nodeEnter.append('circle')
      .attr('r', function(d) {
        return _graphData.scales.radius(d[_config.scales.radius.accessor]);
      })
      .style('fill', function(d) {
        return _graphData.scales.color(d[_config.scales.color.accessor]);
      });
  };

  var _appendText = function _appendText(nodeEnter) {
    nodeEnter.append('text')
      .attr('dx', 16)
      .attr('dy', '.35em')
      .style('font-size', '.7em')
      // TODO? change name to an accessor
      .text(function(d) { return d.name; });
  };

  var _setForce = function _setForce() {
    _force = d3.layout.force()
      .linkDistance(_config.linkDistance)
      .linkStrength(_config.linkStrength)
      .charge(_config.charge)
      .gravity(_config.gravity)
      .friction(_config.friction)
      .size([_config.width, _config.height]);
  };

  var _zoomCallback = function _zoomCallback() {
    return d3.behavior.zoom()
    .scaleExtent([-10,10])
    .on('zoom', function() {
      _container.attr('transform', 'translate(' + d3.event.translate + ')scale(' + d3.event.scale + ')');
    });
  };

  var _clearSvg = function _clearSvg() {
    d3.select(_config.container).selectAll('svg').remove();
  };

  var _setSvg = function _setSvg(zoom) {
    return d3.select(_config.container).append('svg')
      .attr('width', _config.width)
      .attr('height', _config.height)
      .attr('class', 'graph-container')
    .append('g')
      .call(zoom);
  };

  var _setRect = function _setRect(svg) {
    return svg.append('rect')
      .attr("width", _config.width)
      .attr("height", _config.height)
      .style("fill", "none")
      .style("pointer-events", "all");
  };

  var _setContainer = function _setContainer(svg) {
    return svg.append('g');
  };

  var _setLinks = function _setLinks() {
    return _container.selectAll('.link');
  };

  var _setNodes = function _setNodes() {
    return _container.selectAll('.node');
  };

  return {
    init: init,
    update: update,
    redraw: redraw
  };
}(d3));
