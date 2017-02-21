require "rails_helper"

describe SubredditConnector, :vcr do

  describe "#generate_connections" do
    it "gets subreddit users based on posts" do
      users_api = double()
      subreddit = build(:subreddit)
      expect(users_api).to receive(:top_posters).and_return([])
      connector = SubredditConnector.new(users_api: users_api)

      connector.generate_connections(subreddit, 5)
    end

    it "gets connected subreddits based on users' comments" do
      users_api = double()
      posters = ["ExampleUser"]
      allow(users_api).to receive(:top_posters).and_return(posters)
      subreddit = build(:subreddit)
      comments_api = double()
      expect(comments_api).to receive(:most_recent_subreddits).and_return([])

      connector = SubredditConnector.new(comments_api: comments_api,
                                        users_api: users_api)

      connector.generate_connections(subreddit, 5)
    end
  end

end

