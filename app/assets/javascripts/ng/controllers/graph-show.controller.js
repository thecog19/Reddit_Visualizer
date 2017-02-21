var RV = RV || {}
RV.RedditViz.controller('GraphShowCtrl', ['$scope', 'subredditService', '$window',
  function($scope, subredditService, $window) {

    var _showSubreddit = function(d) {
      console.log(d.children, d)
      $scope.subreddit = d;
      $scope.$apply()
    }

    $scope.subredditName = "AskReddit";
    $scope.drawGraph = function() {
      subredditService.getSubreddit($scope.subredditName)
        .then(function(response) {
          RV.config.json.rootId = response.id;
          RV.config.height = $window.innerHeight;
          RV.config.nodeClickHandlers = [ _showSubreddit ];
          $scope.subreddit = response;
          RV.graph.init(RV.config);
        });
    }

    $scope.expandChildren = function(){
      $scope.loadingSubreddits = true;
      console.log()
      RV.graph.expandChildren()
        .then(function() {
          console.log('done')
          $scope.loadingSubreddits = false;
          $scope.$apply()
        })
    }

    $scope.loadingSubreddits = false;
    $scope.drawGraph()
  }])
