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

    _config.width = config.width || 1200;
    _config.height = config.height || 600;
    _config.linkDistance = config.linkDistance || 65;
    _config.linkStrength = config.linkStrength || 1.0;
    _config.charge = config.charge || -60;
    _config.gravity = config.gravity || .01;
    _config.friction = config.friction || 0.9;

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

    _updateForce();

    _bindNodes();
    _bindLinks();
    _linkEnter();
    _nodeEnter();
    for (var i = 0; i < _viewData.nodes[0].length; i++) {
      var node = _viewData.nodes[0][i];
      if (node.__data__.children) {
        node.classList.remove('expandable-node')
      }
    }
  };

  var redraw = function redraw() {
    // Redraw lines
    _viewData.links
      .attr('x1', function(d) { return d.source.x; })
      .attr('y1', function(d) { return d.source.y; })
      .attr('x2', function(d) { return d.target.x; })
      .attr('y2', function(d) { return d.target.y; });

    // Redraw nodes
    _viewData.nodes.attr('transform', function(d) {
      return 'translate(' + d.x + ',' + d.y + ')';
    });
  };

  var _updateForce = function _updateForce() {
    _force
      .nodes(_graphData.nodes)
      .links(_graphData.links)
      .on('tick', _callbacks.tick)
      .start();
  };

  var _bindNodes = function _bindNodes() {
    _viewData.nodes = _viewData.nodes.data(_graphData.nodes, function(d) {
      return d[_config.accessor];
    });
    _viewData.nodes.exit().remove();
  };

  var _bindLinks = function _bindLinks() {
    _viewData.links = _viewData.links.data(_graphData.links, function(d) {
      return d.target[_config.accessor];
    });
    _viewData.links.exit().remove();
  };

  var _linkEnter = function _linkEnter() {
    _viewData.links.enter().insert('line', '.node')
      .attr('class', 'link')
      .attr('stroke-width', function(d) {
        return _graphData.scales.weight(d.target[_config.scales.weight.accessor]);
      });
  };

  var _nodeEnter = function _nodeEnter() {
    var nodeEnter = _viewData.nodes.enter().append('g');

    _appendG(nodeEnter);
    _appendCircle(nodeEnter);
    _appendText(nodeEnter);
  };

  var _appendG = function _appendG(nodeEnter) {
    nodeEnter
      .attr('class', function(d) {
        var klass = 'node'
        if (d.nsfw) klass += ' nsfw-node';
        if (d.matchingId) klass += ' repeat-node';
        if (d.has_children && !d.children) {
          klass += ' expandable-node'
        }
        return klass;
      })
      .on('click', function(d) {
        if (d3.event.defaultPrevented) return;
        _viewData.nodes.classed('active-node', false);
          this.classList += " active-node";
        if (d.matchingId) {
          _runNodeClickHandlers(d);
        } else {
          _callbacks.toggleChildren(d).then(function() {
            _runNodeClickHandlers(d);
          })
        }
      })
      .call(_force.drag);
    };

  var _appendCircle = function _appendCircle(nodeEnter) {
    nodeEnter.append('circle')
      .attr('r', function(d) {
        return _graphData.scales.radius(d[_config.scales.radius.accessor]);
      })
  };

  var _appendText = function _appendText(nodeEnter) {
    nodeEnter.append('text')
      .attr('dy', '.35em')
      .style('font-size', '.8em')
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

  var _centerGraph = function() {
    return d3.behavior.zoom()
    .scaleExtent([-10,10])
    .on('zoom', function() {
      _container.attr('transform', 'translate(' + d3.event.translate + ')scale(' + d3.event.scale + ')');
    });
  };

  var _clearSvg = function _clearSvg() {
    d3.select(_config.container).selectAll('svg').remove();
  };

  var _runNodeClickHandlers = function _runNodeClickHandlers(d) {
    _callbacks.nodeClickHandlers.forEach(function(callback) {
      callback(d);
    })
  }

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

