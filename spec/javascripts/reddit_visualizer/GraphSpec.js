describe('Graph', function() {
  var g;
  var c;
  var testResponse = {"id":2,"name":"The_Donald","subscriber_count":366044,"children":[{"id":4,"name":"funny","subscriber_count":15566062,"weight":33},{"id":35,"name":"GlobalOffensive","subscriber_count":467232,"weight":21},{"id":42,"name":"conspiracy","subscriber_count":430293,"weight":26},{"id":104,"name":"AskThe_Donald","subscriber_count":13569,"weight":81},{"id":105,"name":"AskTrumpSupporters","subscriber_count":23366,"weight":83},{"id":278,"name":"pokemontrades","subscriber_count":53979,"weight":27},{"id":279,"name":"jailbreak","subscriber_count":158036,"weight":50}]}

  beforeEach(function() {
    c = RV.config;
    RV.config.json.base = 'https://localhost:3000/api/v1/subreddits/';
    g = RV.graph();
    g.initialize(c);
    // jasmine.Ajax.install();
  });

  // afterEach(function(){
  //   jasmine.Ajax.uninstall();
  // })

  // describe('svg', function() {
  //   it('should exist on the page', function() {
  //     expect(d3.select('svg')).not.toBeNull();
  //   });
  // });

  describe('#jsonRoute', function(){
    it('should build a correct route', function(){
      expect(g.jsonRoute("1")).toMatch("https://localhost:3000/api/v1/subreddits/1.json");
    });
  });

  // describe("#update", function(){
  //
  //   it('should add nodes to a persisted node list', function(){
  //     g.update(testResponse);
  //     expect(d3.select('circle')).not.toBeNull();
  //   });
  //
  // });
  //
  // describe('async tests', function() {
  //   var value;
  //
  //   beforeEach(function(done) {
  //     g.update(testResponse);
  //
  //     setTimeout(function() {
  //       value = 0;
  //       done();
  //     }, 1000);
  //   });
  //
  //   it('should create lines at target nodes', function() {
  //     value++;
  //     var link = d3.select('.link')[0][0];
  //     var node = d3.select('.node')[0][0];
  //
  //     console.log(link);
  //     console.log(node);
  //
  //     var linkX = link.getAttribute('x2');
  //     var linkY = link.getAttribute('y2');
  //
  //     var nodeXY = node.getAttribute('transform').slice(10, -1).split(',');
  //
  //     expect(linkX).toEqual(nodeXY[0]);
  //     expect(linkY).toEqual(nodeXY[1]);
  //     done();
  //   });
  // });

  // test data models
    // name
    // subscriber_count
    // children
      // name
      // subscriber_count
      // weight

});
