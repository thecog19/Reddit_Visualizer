describe('Graph', function() {
  var g;

  beforeEach(function() {
    RV.config.json.base = 'https://localhost:3000/api/v1/subreddits/';
  });

  describe('svg', function() {
    it('should exist on the page', function() {
      expect(d3.select('svg')).not.toBeNull();
    });
  });
});
