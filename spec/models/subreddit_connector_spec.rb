require "rails_helper"

describe SubredditConnector do

  describe "#generate_connections" do
    it "gets subreddit users based on posts" do
      api = double()
      subreddit = build(:subreddit)
      expect(api).to receive(:get_subreddit_posters).and_return([])
      allow(api).to receive(:get_subreddits_commented_on).and_return([])
      connector = SubredditConnector.new(api: api)

      connector.generate_connections(subreddit, 1)
    end

    it "gets connected subreddits based on users' comments" do
      api = double()
      subreddit = build(:subreddit)
      posters = ["ExampleUser"]
      allow(api).to receive(:get_subreddit_posters).and_return(posters)
      expect(api).to receive(:get_subreddits_commented_on).and_return([])
      connector = SubredditConnector.new(api: api)

      connector.generate_connections(subreddit, 1)
    end

    # TODO more specs
  end

end
