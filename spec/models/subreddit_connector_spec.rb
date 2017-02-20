require "rails_helper"

describe SubredditConnector, :vcr do

  describe "#generate_connections" do
    it "gets subreddit users based on posts" do
      api = double()
      subreddit = build(:subreddit)
      expect(api).to receive(:get_subreddit_posters).and_return([])
      allow(api).to receive(:get_subreddits_commented_on).and_return([])
      connector = SubredditConnector.new(api: api)

      connector.generate_connections(subreddit, 5)
    end

    it "only gets the specified number of users" do
      api = double()
      subreddit = build(:subreddit)
      user_count = 5
      expect(api).to receive(:get_subreddit_posters)
        .with(subreddit, user_count).and_return([])
      allow(api).to receive(:get_subreddits_commented_on).and_return([])
      connector = SubredditConnector.new(api: api)

      connector.generate_connections(subreddit, user_count)
    end

    it "gets connected subreddits based on users' comments" do
      api = double()
      subreddit = build(:subreddit)
      posters = ["ExampleUser"]
      allow(api).to receive(:get_subreddit_posters).and_return(posters)
      expect(api).to receive(:get_subreddits_commented_on).and_return([])
      connector = SubredditConnector.new(api: api)

      connector.generate_connections(subreddit, 5)
    end

    it "returns n connections" do
      # TODO currently does not
    end
  end

end
