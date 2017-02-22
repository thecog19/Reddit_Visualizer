require "rails_helper"

describe SubredditPersister, :vcr do

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
      subeddit_api = double()
      subreddits = Array.new(100) { |n| { url: "a#{n}", name: "a#{n}" } }
      allow(subeddit_api).to receive(:top).and_return(subreddits)
      persister = SubredditPersister.new(subeddit_api: subeddit_api)

      expect {
        persister.collect_subreddits(count)
      }.to change {Subreddit.count}.by(count)
    end

    it "does not make unnecessary api requests" do
      Subreddit.destroy_all
      count = 150
      subreddit_api = double()
      subreddits_a = Array.new(count) { |n| { url: "a#{n}", name: "a#{n}" } }
      expect(subreddit_api).to receive(:top).and_return(subreddits_a)
      persister = SubredditPersister.new(subreddit_api: subreddit_api)

      persister.collect_subreddits(count)
    end

    it "persists a large number of subreddits to database" do
      Subreddit.destroy_all
      count = 200
      persister = SubredditPersister.new

      expect {
        VCR.use_cassette('SubredditpersisterCollectSubreddits.yml',
                         record: :new_episodes) do
          persister.collect_subreddits(count)
        end
      }.to change {Subreddit.count}.by(count)
    end

    it "stops collecting subreddits if failures reaches request limit" do
      count = 5
      subreddit_api = double()
      subreddits_a = Array.new(count) { |n| { url: "a#{n}", name: "a#{n}" } }
      allow(subreddit_api).to receive(:top).and_return(subreddits_a)
      persister = SubredditPersister.new(subreddit_api: subreddit_api,
                                         limit: 0,
                                         failures: 2)


      expect {
        persister.collect_subreddits(count)
      }.to change {Subreddit.count}.by(0)
    end

    it "sets failures to 0 once done collecting subreddits" do
      subreddit_api = double()
      subreddits_a = Array.new(1) { |n| { url: "a#{n}", name: "a#{n}" } }
      allow(subreddit_api).to receive(:top).and_return(subreddits_a)
      persister = SubredditPersister.new(subreddit_api: subreddit_api,
                                         limit: 2,
                                         failures: 2)

      persister.collect_subreddits(2)

      expect(persister.failures).to eq(0)
    end

    it "sets captured to 0 once done collecting subreddits" do
      subreddit_api = double()
      subreddits_a = Array.new(1) { |n| { url: "a#{n}", name: "a#{n}" } }
      allow(subreddit_api).to receive(:top).and_return(subreddits_a)
      persister = SubredditPersister.new(subreddit_api: subreddit_api,
                                         limit: 2,
                                         failures: 2)

      persister.collect_subreddits(2)

      expect(persister.captured).to eq(0)
    end
  end

  describe "#collect_subreddit_connections" do
    it "persists subreddit connections to database" do
      create(:subreddit, name: "AskReddit")
      persister = SubredditPersister.new

      expect {
        persister.collect_subreddit_connections(5)
      }.to change { SubredditConnection.count }.by_at_least(1)
    end
  end

end
