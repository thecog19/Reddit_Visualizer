require "rails_helper"

describe SubredditApi do

  describe "#init" do
    it "sets agent based on environment variable" do
      subreddit_api = SubredditApi.new
      expect(subreddit_api).to respond_to(:agent)
    end

    it "sets username based on environment variable" do
      subreddit_api = SubredditApi.new
      expect(subreddit_api).to respond_to(:username)
    end

    it "sets password based on environment variable" do
      subreddit_api = SubredditApi.new
      expect(subreddit_api).to respond_to(:password)
    end

    it "sets id based on environment variable" do
      subreddit_api = SubredditApi.new
      expect(subreddit_api).to respond_to(:id)
    end

    it "sets secret based on environment variable" do
      subreddit_api = SubredditApi.new
      expect(subreddit_api).to respond_to(:secret)
    end
  end

  describe "#top_subreddits" do
    it "returns an array of subreddit data" do
      subreddit_api = SubredditApi.new

      subreddits = subreddit_api.top_subreddits(1)

      expect(subreddits.length).to eq(1)
    end
  end

end
