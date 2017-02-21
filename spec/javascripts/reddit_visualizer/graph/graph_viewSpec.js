describe('graph_view', function() {

  // var testResponse = {"id":2,"name":"The_Donald","subscriber_count":366044,"children":[{"id":4,"name":"funny","subscriber_count":15566062,"weight":33},{"id":35,"name":"GlobalOffensive","subscriber_count":467232,"weight":21},{"id":42,"name":"conspiracy","subscriber_count":430293,"weight":26},{"id":104,"name":"AskThe_Donald","subscriber_count":13569,"weight":81},{"id":105,"name":"AskTrumpSupporters","subscriber_count":23366,"weight":83},{"id":278,"name":"pokemontrades","subscriber_count":53979,"weight":27},{"id":279,"name":"jailbreak","subscriber_count":158036,"weight":50}]}


  var testResponse = {
  "scales": {},
  "root": {
    "id": 3,
    "name": "The_Donald",
    "subscriber_count": 369048,
    "description": "/r/The_Donald is the forum of choice for the President of the United States, Donald Trump!\n",
    "url": "/r/The_Donald/",
    "subreddit_icon": null,
    "nsfw": null,
    "children": [
      {
        "id": 57,
        "name": "Rainbow6",
        "url": "/r/Rainbow6/",
        "description": "Welcome to the Rainbow 6 subreddit, a community for R6 fans to discuss Rainbow Six Siege and past favorites.",
        "subscriber_count": 109416,
        "connection_weight": 13,
        "subreddit_icon": null,
        "nsfw": null,
        "index": 0,
        "weight": 1,
        "x": 449.76462817315814,
        "y": 480.79100607999,
        "px": 449.7456163876638,
        "py": 480.8156979952276
      },
      {
        "id": 101,
        "name": "uncensorednews",
        "url": "/r/uncensorednews",
        "description": null,
        "subscriber_count": 103109,
        "connection_weight": 7,
        "subreddit_icon": null,
        "nsfw": null,
        "index": 1,
        "weight": 1,
        "x": 549.1855167661415,
        "y": 402.38260673985496,
        "px": 549.1575432821498,
        "py": 402.42113670553135
      },
      {
        "id": 102,
        "name": "milliondollarextreme",
        "url": "/r/milliondollarextreme",
        "description": null,
        "subscriber_count": 11028,
        "connection_weight": 13,
        "subreddit_icon": null,
        "nsfw": null,
        "index": 2,
        "weight": 1,
        "x": 577.7322500723586,
        "y": 473.55131387953685,
        "px": 577.6916040361855,
        "py": 473.57308927002657
      },
      {
        "id": 103,
        "name": "circlejerkaustralia",
        "url": "/r/circlejerkaustralia",
        "description": null,
        "subscriber_count": 2588,
        "connection_weight": 17,
        "subreddit_icon": null,
        "nsfw": null,
        "index": 3,
        "weight": 1,
        "x": 526.0862371299627,
        "y": 523.8073152744461,
        "px": 526.0618526889594,
        "py": 523.8195354676367
      }
    ],
    "index": 4,
    "weight": 4,
    "x": 512.4352744287012,
    "y": 458.1230147650323,
    "px": 512.4077102025899,
    "py": 458.1497715163095
  },
  "nodes": [
    {
      "id": 57,
      "name": "Rainbow6",
      "url": "/r/Rainbow6/",
      "description": "Welcome to the Rainbow 6 subreddit, a community for R6 fans to discuss Rainbow Six Siege and past favorites.",
      "subscriber_count": 109416,
      "connection_weight": 13,
      "subreddit_icon": null,
      "nsfw": null,
      "index": 0,
      "weight": 1,
      "x": 449.76462817315814,
      "y": 480.79100607999,
      "px": 449.7456163876638,
      "py": 480.8156979952276
    },
    {
      "id": 101,
      "name": "uncensorednews",
      "url": "/r/uncensorednews",
      "description": null,
      "subscriber_count": 103109,
      "connection_weight": 7,
      "subreddit_icon": null,
      "nsfw": null,
      "index": 1,
      "weight": 1,
      "x": 549.1855167661415,
      "y": 402.38260673985496,
      "px": 549.1575432821498,
      "py": 402.42113670553135
    },
    {
      "id": 102,
      "name": "milliondollarextreme",
      "url": "/r/milliondollarextreme",
      "description": null,
      "subscriber_count": 11028,
      "connection_weight": 13,
      "subreddit_icon": null,
      "nsfw": null,
      "index": 2,
      "weight": 1,
      "x": 577.7322500723586,
      "y": 473.55131387953685,
      "px": 577.6916040361855,
      "py": 473.57308927002657
    },
    {
      "id": 103,
      "name": "circlejerkaustralia",
      "url": "/r/circlejerkaustralia",
      "description": null,
      "subscriber_count": 2588,
      "connection_weight": 17,
      "subreddit_icon": null,
      "nsfw": null,
      "index": 3,
      "weight": 1,
      "x": 526.0862371299627,
      "y": 523.8073152744461,
      "px": 526.0618526889594,
      "py": 523.8195354676367
    },
    {
      "id": 3,
      "name": "The_Donald",
      "subscriber_count": 369048,
      "description": "/r/The_Donald is the forum of choice for the President of the United States, Donald Trump!\n",
      "url": "/r/The_Donald/",
      "subreddit_icon": null,
      "nsfw": null,
      "children": [
        {
          "id": 57,
          "name": "Rainbow6",
          "url": "/r/Rainbow6/",
          "description": "Welcome to the Rainbow 6 subreddit, a community for R6 fans to discuss Rainbow Six Siege and past favorites.",
          "subscriber_count": 109416,
          "connection_weight": 13,
          "subreddit_icon": null,
          "nsfw": null,
          "index": 0,
          "weight": 1,
          "x": 449.76462817315814,
          "y": 480.79100607999,
          "px": 449.7456163876638,
          "py": 480.8156979952276
        },
        {
          "id": 101,
          "name": "uncensorednews",
          "url": "/r/uncensorednews",
          "description": null,
          "subscriber_count": 103109,
          "connection_weight": 7,
          "subreddit_icon": null,
          "nsfw": null,
          "index": 1,
          "weight": 1,
          "x": 549.1855167661415,
          "y": 402.38260673985496,
          "px": 549.1575432821498,
          "py": 402.42113670553135
        },
        {
          "id": 102,
          "name": "milliondollarextreme",
          "url": "/r/milliondollarextreme",
          "description": null,
          "subscriber_count": 11028,
          "connection_weight": 13,
          "subreddit_icon": null,
          "nsfw": null,
          "index": 2,
          "weight": 1,
          "x": 577.7322500723586,
          "y": 473.55131387953685,
          "px": 577.6916040361855,
          "py": 473.57308927002657
        },
        {
          "id": 103,
          "name": "circlejerkaustralia",
          "url": "/r/circlejerkaustralia",
          "description": null,
          "subscriber_count": 2588,
          "connection_weight": 17,
          "subreddit_icon": null,
          "nsfw": null,
          "index": 3,
          "weight": 1,
          "x": 526.0862371299627,
          "y": 523.8073152744461,
          "px": 526.0618526889594,
          "py": 523.8195354676367
        }
      ],
      "index": 4,
      "weight": 4,
      "x": 512.4352744287012,
      "y": 458.1230147650323,
      "px": 512.4077102025899,
      "py": 458.1497715163095
    }
  ],
  "links": [
    {
      "source": {
        "id": 3,
        "name": "The_Donald",
        "subscriber_count": 369048,
        "description": "/r/The_Donald is the forum of choice for the President of the United States, Donald Trump!\n",
        "url": "/r/The_Donald/",
        "subreddit_icon": null,
        "nsfw": null,
        "children": [
          {
            "id": 57,
            "name": "Rainbow6",
            "url": "/r/Rainbow6/",
            "description": "Welcome to the Rainbow 6 subreddit, a community for R6 fans to discuss Rainbow Six Siege and past favorites.",
            "subscriber_count": 109416,
            "connection_weight": 13,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 0,
            "weight": 1,
            "x": 449.76462817315814,
            "y": 480.79100607999,
            "px": 449.7456163876638,
            "py": 480.8156979952276
          },
          {
            "id": 101,
            "name": "uncensorednews",
            "url": "/r/uncensorednews",
            "description": null,
            "subscriber_count": 103109,
            "connection_weight": 7,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 1,
            "weight": 1,
            "x": 549.1855167661415,
            "y": 402.38260673985496,
            "px": 549.1575432821498,
            "py": 402.42113670553135
          },
          {
            "id": 102,
            "name": "milliondollarextreme",
            "url": "/r/milliondollarextreme",
            "description": null,
            "subscriber_count": 11028,
            "connection_weight": 13,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 2,
            "weight": 1,
            "x": 577.7322500723586,
            "y": 473.55131387953685,
            "px": 577.6916040361855,
            "py": 473.57308927002657
          },
          {
            "id": 103,
            "name": "circlejerkaustralia",
            "url": "/r/circlejerkaustralia",
            "description": null,
            "subscriber_count": 2588,
            "connection_weight": 17,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 3,
            "weight": 1,
            "x": 526.0862371299627,
            "y": 523.8073152744461,
            "px": 526.0618526889594,
            "py": 523.8195354676367
          }
        ],
        "index": 4,
        "weight": 4,
        "x": 512.4352744287012,
        "y": 458.1230147650323,
        "px": 512.4077102025899,
        "py": 458.1497715163095
      },
      "target": {
        "id": 57,
        "name": "Rainbow6",
        "url": "/r/Rainbow6/",
        "description": "Welcome to the Rainbow 6 subreddit, a community for R6 fans to discuss Rainbow Six Siege and past favorites.",
        "subscriber_count": 109416,
        "connection_weight": 13,
        "subreddit_icon": null,
        "nsfw": null,
        "index": 0,
        "weight": 1,
        "x": 449.76462817315814,
        "y": 480.79100607999,
        "px": 449.7456163876638,
        "py": 480.8156979952276
      }
    },
    {
      "source": {
        "id": 3,
        "name": "The_Donald",
        "subscriber_count": 369048,
        "description": "/r/The_Donald is the forum of choice for the President of the United States, Donald Trump!\n",
        "url": "/r/The_Donald/",
        "subreddit_icon": null,
        "nsfw": null,
        "children": [
          {
            "id": 57,
            "name": "Rainbow6",
            "url": "/r/Rainbow6/",
            "description": "Welcome to the Rainbow 6 subreddit, a community for R6 fans to discuss Rainbow Six Siege and past favorites.",
            "subscriber_count": 109416,
            "connection_weight": 13,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 0,
            "weight": 1,
            "x": 449.76462817315814,
            "y": 480.79100607999,
            "px": 449.7456163876638,
            "py": 480.8156979952276
          },
          {
            "id": 101,
            "name": "uncensorednews",
            "url": "/r/uncensorednews",
            "description": null,
            "subscriber_count": 103109,
            "connection_weight": 7,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 1,
            "weight": 1,
            "x": 549.1855167661415,
            "y": 402.38260673985496,
            "px": 549.1575432821498,
            "py": 402.42113670553135
          },
          {
            "id": 102,
            "name": "milliondollarextreme",
            "url": "/r/milliondollarextreme",
            "description": null,
            "subscriber_count": 11028,
            "connection_weight": 13,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 2,
            "weight": 1,
            "x": 577.7322500723586,
            "y": 473.55131387953685,
            "px": 577.6916040361855,
            "py": 473.57308927002657
          },
          {
            "id": 103,
            "name": "circlejerkaustralia",
            "url": "/r/circlejerkaustralia",
            "description": null,
            "subscriber_count": 2588,
            "connection_weight": 17,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 3,
            "weight": 1,
            "x": 526.0862371299627,
            "y": 523.8073152744461,
            "px": 526.0618526889594,
            "py": 523.8195354676367
          }
        ],
        "index": 4,
        "weight": 4,
        "x": 512.4352744287012,
        "y": 458.1230147650323,
        "px": 512.4077102025899,
        "py": 458.1497715163095
      },
      "target": {
        "id": 101,
        "name": "uncensorednews",
        "url": "/r/uncensorednews",
        "description": null,
        "subscriber_count": 103109,
        "connection_weight": 7,
        "subreddit_icon": null,
        "nsfw": null,
        "index": 1,
        "weight": 1,
        "x": 549.1855167661415,
        "y": 402.38260673985496,
        "px": 549.1575432821498,
        "py": 402.42113670553135
      }
    },
    {
      "source": {
        "id": 3,
        "name": "The_Donald",
        "subscriber_count": 369048,
        "description": "/r/The_Donald is the forum of choice for the President of the United States, Donald Trump!\n",
        "url": "/r/The_Donald/",
        "subreddit_icon": null,
        "nsfw": null,
        "children": [
          {
            "id": 57,
            "name": "Rainbow6",
            "url": "/r/Rainbow6/",
            "description": "Welcome to the Rainbow 6 subreddit, a community for R6 fans to discuss Rainbow Six Siege and past favorites.",
            "subscriber_count": 109416,
            "connection_weight": 13,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 0,
            "weight": 1,
            "x": 449.76462817315814,
            "y": 480.79100607999,
            "px": 449.7456163876638,
            "py": 480.8156979952276
          },
          {
            "id": 101,
            "name": "uncensorednews",
            "url": "/r/uncensorednews",
            "description": null,
            "subscriber_count": 103109,
            "connection_weight": 7,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 1,
            "weight": 1,
            "x": 549.1855167661415,
            "y": 402.38260673985496,
            "px": 549.1575432821498,
            "py": 402.42113670553135
          },
          {
            "id": 102,
            "name": "milliondollarextreme",
            "url": "/r/milliondollarextreme",
            "description": null,
            "subscriber_count": 11028,
            "connection_weight": 13,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 2,
            "weight": 1,
            "x": 577.7322500723586,
            "y": 473.55131387953685,
            "px": 577.6916040361855,
            "py": 473.57308927002657
          },
          {
            "id": 103,
            "name": "circlejerkaustralia",
            "url": "/r/circlejerkaustralia",
            "description": null,
            "subscriber_count": 2588,
            "connection_weight": 17,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 3,
            "weight": 1,
            "x": 526.0862371299627,
            "y": 523.8073152744461,
            "px": 526.0618526889594,
            "py": 523.8195354676367
          }
        ],
        "index": 4,
        "weight": 4,
        "x": 512.4352744287012,
        "y": 458.1230147650323,
        "px": 512.4077102025899,
        "py": 458.1497715163095
      },
      "target": {
        "id": 102,
        "name": "milliondollarextreme",
        "url": "/r/milliondollarextreme",
        "description": null,
        "subscriber_count": 11028,
        "connection_weight": 13,
        "subreddit_icon": null,
        "nsfw": null,
        "index": 2,
        "weight": 1,
        "x": 577.7322500723586,
        "y": 473.55131387953685,
        "px": 577.6916040361855,
        "py": 473.57308927002657
      }
    },
    {
      "source": {
        "id": 3,
        "name": "The_Donald",
        "subscriber_count": 369048,
        "description": "/r/The_Donald is the forum of choice for the President of the United States, Donald Trump!\n",
        "url": "/r/The_Donald/",
        "subreddit_icon": null,
        "nsfw": null,
        "children": [
          {
            "id": 57,
            "name": "Rainbow6",
            "url": "/r/Rainbow6/",
            "description": "Welcome to the Rainbow 6 subreddit, a community for R6 fans to discuss Rainbow Six Siege and past favorites.",
            "subscriber_count": 109416,
            "connection_weight": 13,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 0,
            "weight": 1,
            "x": 449.76462817315814,
            "y": 480.79100607999,
            "px": 449.7456163876638,
            "py": 480.8156979952276
          },
          {
            "id": 101,
            "name": "uncensorednews",
            "url": "/r/uncensorednews",
            "description": null,
            "subscriber_count": 103109,
            "connection_weight": 7,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 1,
            "weight": 1,
            "x": 549.1855167661415,
            "y": 402.38260673985496,
            "px": 549.1575432821498,
            "py": 402.42113670553135
          },
          {
            "id": 102,
            "name": "milliondollarextreme",
            "url": "/r/milliondollarextreme",
            "description": null,
            "subscriber_count": 11028,
            "connection_weight": 13,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 2,
            "weight": 1,
            "x": 577.7322500723586,
            "y": 473.55131387953685,
            "px": 577.6916040361855,
            "py": 473.57308927002657
          },
          {
            "id": 103,
            "name": "circlejerkaustralia",
            "url": "/r/circlejerkaustralia",
            "description": null,
            "subscriber_count": 2588,
            "connection_weight": 17,
            "subreddit_icon": null,
            "nsfw": null,
            "index": 3,
            "weight": 1,
            "x": 526.0862371299627,
            "y": 523.8073152744461,
            "px": 526.0618526889594,
            "py": 523.8195354676367
          }
        ],
        "index": 4,
        "weight": 4,
        "x": 512.4352744287012,
        "y": 458.1230147650323,
        "px": 512.4077102025899,
        "py": 458.1497715163095
      },
      "target": {
        "id": 103,
        "name": "circlejerkaustralia",
        "url": "/r/circlejerkaustralia",
        "description": null,
        "subscriber_count": 2588,
        "connection_weight": 17,
        "subreddit_icon": null,
        "nsfw": null,
        "index": 3,
        "weight": 1,
        "x": 526.0862371299627,
        "y": 523.8073152744461,
        "px": 526.0618526889594,
        "py": 523.8195354676367
      }
    }
  ]
}

  describe('config', function() {

    var mock = GRAPH.view
    var spy;
    var trojanCallbacks = {tick: function(){},
                          toggleChildren: function(){}}
    var model = GRAPH.model
    var app = RV.graph

    beforeEach(function(){
      spyOn(model, "init").and.callFake(function(){
        return testResponse
      })
      app.init(RV.config)

    })

    it("Has an svg", function(){
      console.log(d3.select('svg'))
      expect($("svg").length).toBe(1)
    })


  });

});
