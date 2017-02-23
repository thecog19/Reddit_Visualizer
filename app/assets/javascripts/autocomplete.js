var substringMatcher = function(strs) {
  return function findMatches(q, cb) {
    var matches, substringRegex;

    matches = [];

    substrRegex = new RegExp(q, 'i');

    $.each(strs, function(i, str) {
      if (substrRegex.test(str)) {
        matches.push(str);
      }
    });

    cb(matches);
  };
};

var subreddits = [];
var search_reddits = [];
$.ajax( { url: 'api/v1/subreddits.json',
        dataType: 'json',
        success: function(response) {extract_names(response)},
        error: function(response){
          return []
        }
})

var extract_names = function(response) {
  for (var i = 0; i < response.length; i++) {
    subreddits.push(response[i].name)
    search_reddits.push(response[i].name)
  }
}

$(document).ready(function() {
  $('#search-input .typeahead').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  },
  {
    name: 'subreddits',
    source: substringMatcher(subreddits)
  });
  $('#path-input .typeahead').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  },
  {
    name: 'search_reddits',
    source: substringMatcher(search_reddits)
  });
})
