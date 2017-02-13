class SubredditsController < ApplicationController

  def show
    @subreddit = {
      "id" => 11,
      "name" => "AskReddit",
      "numSubscribers" => 15652682,
      "activeUsers" => 652682,
      "children" => [
        {
          "id" => 12,
          "name" => "politics",
          "numSubscribers" => 3293964,
          "activeUsers" => 93964
        },
        {
          "id" => 2,
          "name" => "funny",
          "numSubscribers" => 15496275,
          "activeUsers" => 496275
        },
        {
          "id" => 3,
          "name" => "pics",
          "numSubscribers" => 15268808,
          "activeUsers" => 268808
        },
        {
          "id" => 4,
          "name" => "todayilearned",
          "numSubscribers" => 15486087,
          "activeUsers" => 486087
        },
        {
          "id" => 5,
          "name" => "worldnews",
          "numSubscribers" => 15298316,
          "activeUsers" => 298316
        }
      ]
    }

    @subreddit12 = {
      "id" => 12,
      "name" => "politics",
      "numSubscribers" => 3293964,
      "activeUsers" => 93964,
      "children" => [
        {
          "id" => 6,
          "name" => "The_Donald",
          "numSubscribers" => 364364,
          "activeUsers" => 4364
        },
        {
          "id" => 7,
          "name" => "news",
          "numSubscribers" => 12766077,
          "activeUsers" => 766077
        },
        {
          "id" => 8,
          "name" => "PoliticalDiscussion",
          "numSubscribers" => 124107,
          "activeUsers" => 4107
        },
        {
          "id" => 9,
          "name" => "ukpolitics",
          "numSubscribers" => 70148,
          "activeUsers" => 148
        },
        {
          "id" => 10,
          "name" => "trees",
          "numSubscribers" => 917788,
          "activeUsers" => 7788
        }
      ]
    }

    respond_to do |format|
      format.json {
        render json: @subreddit if params[:id] == "1"
        render json: @subreddit12 if params[:id] == "12"
      }
    end
  end

end
