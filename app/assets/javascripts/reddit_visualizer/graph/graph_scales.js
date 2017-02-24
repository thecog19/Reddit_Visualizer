var GRAPH = GRAPH || {};

GRAPH.scales = (function(d3) {

  var _scales = {};
  var _config;

  var init = function init(configScales) {
    _config = configScales;
    _setScales();
  };

  var _setScales = function _setScales() {
    var rad = _config.radius;
    var col = _config.color;
    var weight = _config.weight;
    _scales.radius = d3.scale.sqrt().range([rad.min, rad.max]);
    _scales.color = d3.scale.log().range([col.min, col.max]);
    _scales.weight = d3.scale.sqrt().range([weight.min, weight.max]);
  };

  var getScales = function getScales() {
    return _scales;
  };

  var setScaleDomains = function setScaleDomains(nodes) {
    _scales.radius.domain(
      d3.extent(nodes, function(d) {
        return d[_config.radius.accessor];
      })
    );

    _scales.color.domain(
      d3.extent(nodes, function(d) {
        return d[_config.color.accessor];
      })
    );

    _scales.weight.domain(
      d3.extent(nodes, function(d) {
        return d[_config.weight.accessor];
      })
    );
  };

  return {
    init: init,
    setScaleDomains: setScaleDomains,
    getScales: getScales
  };

}(d3));
