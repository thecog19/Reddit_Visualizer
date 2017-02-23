var RV = RV || {}
RV.RedditViz.controller('GraphShowCtrl', ['$scope', 'subredditService', '$window',
  function($scope, subredditService, $window) {

    var _showSubreddit = function(d) {
      $scope.subreddit = d;
      $scope.$apply()
    }

    $scope.subredditName = "AskReddit";
    $scope.drawGraph = function() {
      subredditService.getSubreddit($scope.subredditName)
        .then(function(response) {
          RV.config.json.rootId = response.id;
          RV.config.height = $window.innerHeight;
          RV.config.width = $window.innerWidth * .75;
          RV.config.nodeClickHandlers = [ _showSubreddit ];
          $scope.errors = null;
          $scope.subreddit = response;
          RV.graph.init(RV.config);
        })
        .catch(function(error) {
          $scope.errors = error.data
        });
    }

    $scope.findPath = function(destinationSubreddit) {
      subredditService.findPath($scope.subredditName, destinationSubreddit).then(function(response){
          RV.graph.init(RV.config, response)
      })
    }

    $(".tt-dataset").on("click",".tt-suggestion", function(e){
      var text = e.currentTarget.innerText
      $scope.subredditName = text
    })

    $scope.expandChildren = function(){
      $scope.loadingSubreddits = true;
      RV.graph.expandChildren()
        .then(function() {
          $scope.loadingSubreddits = false;
          $scope.$apply()
        })
    }

    $scope.clearErrors = function() {
      $scope.errors = null;
    }

    $scope.loadingSubreddits = false;
    $scope.drawGraph()
  }])
