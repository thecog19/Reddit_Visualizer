RV.RedditViz.factory('subredditService', ['Restangular', function(Restangular) {
  var getSubreddit = function(name) {
    return Restangular.one('subreddits', 0).customGET('', {name: name})
  }

  return {
    getSubreddit: getSubreddit
  }
}])
