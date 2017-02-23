RV.RedditViz.factory('subredditService', ['Restangular', function(Restangular) {

  var getSubreddit = function(name) {
    return Restangular.one('subreddits', 0).customGET('', {name: name})
  }

  var findPath = function(beginningSubreddit, destinationSubreddit) {
    return Restangular.one('paths', 0).customGET('', { beginning: beginningSubreddit, destination: destinationSubreddit });

    // $.ajax({
    //   url: '/api/v1/paths/' + 0 + '.json',
    //   dataType: 'json',
    //   data: {beginning: beginningSubreddit, destination: destinationSubreddit},
    // })
  }

  return {
    getSubreddit: getSubreddit,
    findPath: findPath
  }
}])
