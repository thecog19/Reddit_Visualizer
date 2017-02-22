require "rails_helper"

describe SubredditApi, :vcr do

  describe "#top_subreddits" do
    it "returns an array of subreddit data" do
      subreddit_api = SubredditApi.new

      subreddits = subreddit_api.top_subreddits(1, 0)

      expect(subreddits.length).to eq(1)
    end

    it "uses client to communicate with the API" do
      client = double()
      expect(client).to receive(:get).and_return({"data" => {"children" => []}})
      expect(client).to receive(:post).and_return({})
      subreddit_api = SubredditApi.new(client: client)

      subreddit_api.top_subreddits(2, 0)
    end
  end

  describe "#get_subreddit_authors" do
    it "returns an array of unique authors" do
      client = double()
      posts = [
        { "data" => { "author" => "author1" }},
        { "data" => { "author" => "author2" }},
        { "data" => { "author" => "author1" }}
              ]
      response = { "data" => { "children" => posts }}
      allow(client).to receive(:get).and_return(response)
      allow(client).to receive(:post).and_return({})
      subreddit_api = SubredditApi.new(client: client)

      subreddit = create(:subreddit)
      authors = subreddit_api.get_subreddit_posters(subreddit, 2)

      expect(authors).to be_a(Array)
      expect(authors.length).to eq(2)
    end
  end

end
