require "rails_helper"

describe SubredditConnector, :vcr do

  context "subreddits exist"
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

    it "returns an array of subreddit connections when they exist" do
      subreddit = build(:subreddit, name: "AskReddit")
      connector = SubredditConnector.new

      connections = connector.generate_connections(subreddit, 5)

      expect(connections.length).to be > 1
    end

    it "returns an array of hashes" do
      subreddit = build(:subreddit, name: "AskReddit")
      connector = SubredditConnector.new

      connections = connector.generate_connections(subreddit, 5)
      all_connections = connections.all? { |c| c.is_a?(Hash) }

      expect(all_connections).to be true
    end
  end

  context "subreddit does not exist" do
    describe "#generate_connections" do
      it "returns an empty array" do
        subreddit = build(:subreddit, name: "A")
        connector = SubredditConnector.new

        connections = connector.generate_connections(subreddit, 5)

        expect(connections.empty?).to be true
      end
    end
  end

end

