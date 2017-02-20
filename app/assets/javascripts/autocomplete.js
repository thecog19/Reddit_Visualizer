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
$.ajax({ url: 'api/v1/subreddits.json',
  dataType: 'json' }).complete(function(response) {
    extract_names(response.responseJSON)
})

var extract_names = function(response) {
  for (var i = 0; i < response.length; i++) {
    subreddits.push(response[i].name)
  }
}

$(window).ready(function() {
  $('#the-basics .typeahead').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  },
  {
    name: 'subreddits',
    source: substringMatcher(subreddits)
  });
})
