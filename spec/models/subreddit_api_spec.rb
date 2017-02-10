require "rails_helper"

describe SubredditApi do

  describe "#top_subreddits" do
    it "returns an array of subreddit data" do
      subreddit_api = SubredditApi.new

      subreddits = subreddit_api.top_subreddits(1)

      expect(subreddits.length).to eq(1)
    end
  end

end
