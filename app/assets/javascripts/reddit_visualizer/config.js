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
      accessor: 'numSubscribers'
    },
    color: {
      min: '#fff',
      max: '#3182bd',
      accessor: 'activeUsers'
    }
  },

  json: {
    base: '/subreddits/',
    suffix: '.json',
    rootId: '1',
    accessor: 'id'
  }
};

RV.graph(RV.config);
