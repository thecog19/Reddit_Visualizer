var RV = RV || {}
RV.RedditViz.controller('GraphShowCtrl', ['$scope', 'subredditService',
  function($scope, subredditService) {
    $scope.subredditName = "AskReddit";
    $scope.drawGraph = function() {
      subredditService.getSubreddit($scope.subredditName)
        .then(function(response) {
          RV.config.json.rootId = response.id
          RV.graph(RV.config)
        })
    }
    $scope.drawGraph()
  }])
