'use strict';

var RV = RV || {};

RV.config = {

  width: 1200,
  height: 600,
  container: 'body',

  // required, for now
  scales: {
    radius: {
      min: 5,
      max: 15,
      accessor: 'subscriber_count'
    },
    color: {
      min: '#fff',
      max: '#3182bd',
      accessor: 'activeUsers'
    }
  },

  json: {
    base: '/api/v1/subreddits/',
    suffix: '.json',
    // TODO change to root id
    rootId: '5',
    accessor: 'id'
  }
};

$(function() {
  RV.graph(RV.config);
});
