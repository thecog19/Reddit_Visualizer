'use strict';

var GRAPH = GRAPH || {};

GRAPH.view = (function(d3) {

  var _selectors = {};
  var _config;
  var _callbacks;
  var _force;
  var _container;

  var init = function init(config) {
    // select inital dom elements
    var svg, zoom, viewData = {};
    _config = config;
    _callbacks = callbacks;
    _setForce();
    zoom = _zoomCallback();
    _clearSvg();
    svg = _setSvg(zoom);
    _setRect(svg);
    _container = _setContainer(svg);
    viewData.links = _setLinks();
    viewData.nodes = _setNodes();
    viewData.scales = _setScales();
    return viewData;
  }

  var update = function update(graphData)  {
    // update dom elements with graphData
  }

  var _setForce() {
    _force = d3.layout.force()
      .linkDistance(_config.linkDistance)
      .linkStrength(_config.linkStrength)
      .charge(_config.charge)
      .gravity(_config.gravity)
      .friction(_config.friction)
      .size([_config.width, _config.height]);
  }

  var _zoomCallback = function _zoomCallback() {
    return d3.behavior.zoom()
    .scaleExtent([-10,10])
    .on('zoom', function() {
      _container.attr('transform', 'translate(' + d3.event.translate + ')scale(' + d3.event.scale + ')');
    })
  }

  var _clearSvg = function _clearSvg() {
    d3.select(_config.container).selectAll('svg').remove();
  }

  var _setSvg = function _setSvg(zoom) {
    return d3.select(_config.container).append('svg')
      .attr('width', _config.width)
      .attr('height', _config.height)
      .attr('class', 'graph-container')
    .append('g')
      .call(zoom);
  }

  var _setRect = function _setRect(svg) {
    return svg.append('rect')
      .attr("width", _config.width)
      .attr("height", _config.height)
      .style("fill", "none")
      .style("pointer-events", "all");
  }

  var _setContainer = function _setContainer(svg) {
    return svg.append('g')
  }

  var _setLinks = function _setLinks() {
    return _container.selectAll('.link')
  }

  var _setNodes = function _setNodes() {
    return _container.selectAll('.node')
  }

  var _setScales = function _setScales() {
    var scales = {};
    var rad = _config.scales.radius;
    var col = _config.scales.color;
    var weight = _config.scales.weight;
    scales.radius = d3.scale.sqrt().range([rad.min, rad.max]);
    scales.color = d3.scale.log().range([col.min, col.max]);
    scales.weight = d3.scale.sqrt().range([weight.min, weight.max]);
    return scales;
  }

  return {
    init: init,
    update: update
  }
}(d3));
