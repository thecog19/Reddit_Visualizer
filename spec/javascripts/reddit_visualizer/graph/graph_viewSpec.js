describe('graph_view', function() {

  var testResponse = {"id":2,"name":"The_Donald","subscriber_count":366044,"children":[{"id":4,"name":"funny","subscriber_count":15566062,"weight":33},{"id":35,"name":"GlobalOffensive","subscriber_count":467232,"weight":21},{"id":42,"name":"conspiracy","subscriber_count":430293,"weight":26},{"id":104,"name":"AskThe_Donald","subscriber_count":13569,"weight":81},{"id":105,"name":"AskTrumpSupporters","subscriber_count":23366,"weight":83},{"id":278,"name":"pokemontrades","subscriber_count":53979,"weight":27},{"id":279,"name":"jailbreak","subscriber_count":158036,"weight":50}]}

  beforeEach(function() {
    jasmine.Ajax.install();
  });

  afterEach(function(){
    jasmine.Ajax.uninstall();
  });

  describe('config', function() {

    it('creates an svg on the window', function() {
      jasmine.Ajax.stubRequest('/api/v1/subreddits.json').andReturn({
        responseText: [{"name":"todayilearned"},{"name":"leagueoflegends"}]
      });

      // GRAPH.view.init(RV.config);

      expect($('svg').length).not.toBe(0);

    });

    // it('adds links to the svg', function() {

      // jasmine.Ajax.stubRequest('/api/v1/subreddits/2.json').andReturn({
      //   testResponse
      // });

      // expect($('.definitely-not-a-class').length).not.toBe(0);

    // });

  });

});
