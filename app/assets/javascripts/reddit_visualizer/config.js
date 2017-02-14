'use strict';

var RV = RV || {};

RV.config = {

  width: 1200,
  height: 600,
  container: 'body',

  // required, for now
  scales: {
    radius: {
      min: 15,
      max: 50,
      accessor: 'subscriber_count'
    },
    color: {
      min: '#fff',
      max: '#3182bd',
      accessor: 'activeUsers'
    },
    connection_weight: {
      min: 1,
      max: 5,
      accessor: 'connection_weight'
    }
  },

  json: {
    base: '/api/v1/subreddits/',
    suffix: '.json',
    // TODO change to root id
    rootId: '1',
    accessor: 'id'
  }
};

$(function() {
  RV.graph(RV.config);
});
