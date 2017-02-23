var RV = RV || {}
RV.RedditViz.controller('GraphShowCtrl', ['$scope', '$timeout', 'subredditService', '$window',
  function($scope, $timeout, subredditService, $window) {

    var _showSubreddit = function _showSubreddit(d) {
      $scope.subreddit = d;
      $scope.$apply();
    };

    var _showErrors = function _showErrors(error) {
      $scope.errors = error.data;
      $scope.loadingPath = false;
      $scope.loadingSubreddits = false;
      $timeout($scope.clearErrors, 5000);
    };

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
        .catch(_showErrors);
    };

    $scope.findPath = function(destinationSubreddit) {
      $scope.loadingPath = true;
      subredditService.findPath($scope.subredditName, destinationSubreddit).then(function(response){
          RV.graph.init(RV.config, response);
          $scope.loadingPath = false;
      })
      .catch(_showErrors);
    };

    $("#search-input .tt-dataset").on("select",".tt-suggestion", function(e){
      var text = e.currentTarget.innerText;
      $scope.subredditName = text;
    });

    $("#path-input .tt-dataset").on("select",".tt-suggestion", function(e){
      var text = e.currentTarget.innerText;
      $scope.destinationSubreddit = text;
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
