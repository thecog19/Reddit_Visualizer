RV.RedditViz.directive('subredditDetail', function() {
  return {
    templateUrl: '/directives/subreddit-detail.html',
    restrict: 'E',
    scope: {
      subreddit: '='
    }
  }
})