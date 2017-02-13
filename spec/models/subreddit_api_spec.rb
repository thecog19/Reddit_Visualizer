require "rails_helper"

describe SubredditApi do

  describe "#top_subreddits" do
    it "returns an array of subreddit data" do
      subreddit_api = SubredditApi.new

      subreddits = subreddit_api.top_subreddits(1)

      expect(subreddits.length).to eq(1)
    end

    it "uses client to communicate with the API" do
      client = double()
      expect(client).to receive(:get).and_return({'data' => {'children' => []}})
      expect(client).to receive(:post).and_return({})
      subreddit_api = SubredditApi.new(client: client)

      subreddit_api.top_subreddits(1)
    end

  end

end
