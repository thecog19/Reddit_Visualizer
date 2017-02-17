require "rails_helper"

describe SubredditPersister do

  describe "#collect_subreddits" do
    it "persists n subreddits to the database" do
      count = 19
      persister = SubredditPersister.new

      expect {
        persister.collect_subreddits(count)
      }.to change {Subreddit.count}.by(count)
    end

    it "does not persist more than requested" do
      Subreddit.destroy_all
      count = 75
      api = double()
      subreddits = Array.new(100) { |n| { url: "a#{n}", name: "a#{n}" } }
      allow(api).to receive(:top_subreddits).and_return(subreddits)
      persister = SubredditPersister.new(api: api)

      expect {
        persister.collect_subreddits(count)
      }.to change {Subreddit.count}.by(count)
    end

    it "does not make unnecessary api requests" do
      Subreddit.destroy_all
      count = 150
      api = double()
      subreddits = Array.new(count + 1) { |n| { url: "a#{n}", name: "a#{n}" } }
      expect(api).to receive(:top_subreddits).and_return(subreddits)
      persister = SubredditPersister.new(api: api)

      expect {
        persister.collect_subreddits(count)
      }.to change {Subreddit.count}.by(count)
    end

    it "persists a large number of subreddits to database" do
      Subreddit.destroy_all
      count = 200
      persister = SubredditPersister.new

      expect {
        persister.collect_subreddits(count)
      }.to change {Subreddit.count}.by(count)
    end
  end

  describe "#collect_subreddit_connections" do
    it "persists subreddit connections to database" do
      SubredditConnection.destroy_all
      create(:subreddit)
      subreddit = create(:subreddit, name: "New Subreddit")
      api = double()
      allow(api).to receive(:get_subreddit_posters).and_return({ bob: 7 })
      allow(api).to receive(:get_subreddits_commented_on).and_return([subreddit.name])
      persister = SubredditPersister.new(api: api)

      expect {
        persister.collect_subreddit_connections(1)
      }.to change { SubredditConnection.count }.by(1)
    end
  end

end
