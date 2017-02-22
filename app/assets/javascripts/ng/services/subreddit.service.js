RV.RedditViz.factory('subredditService', ['Restangular', function(Restangular) {

  var getSubreddit = function(name) {
    return Restangular.one('subreddits', 0).customGET('', {name: name})
  }

  var findPath = function(beginningSubreddit, destinationSubreddit) {
    $.ajax({
      url: '/api/v1/paths/' + 0 + '.json',
      dataType: 'json',
      data: {beginning: beginningSubreddit, destination: destinationSubreddit},
      success: function(response) {console.log("response", response)}
    })
  }

  return {
    getSubreddit: getSubreddit,
    findPath: findPath
  }
}])
