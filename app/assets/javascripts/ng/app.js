var RV = RV || {}

RV.RedditViz = angular.module('RedditViz', ['restangular'])
  .constant('_', window._)
  .config(['RestangularProvider', function(RestangularProvider) {
    RestangularProvider.setBaseUrl('/api/v1')
    RestangularProvider.setRequestSuffix('.json')
    RestangularProvider.setDefaultHttpFields({
      "content-type": 'application/json'
    })
  }])
