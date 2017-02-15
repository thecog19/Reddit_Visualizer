'use strict';

var RV = RV || {};

RV.config = {

  width: 1200,
  height: 600,
  container: '#graph',

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
      accessor: 'subscriber_count'
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
