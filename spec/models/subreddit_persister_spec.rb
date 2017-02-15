require "rails_helper"

describe SubredditPersister do

  describe "#collect_subreddits" do
    it "persists n subreddits to database" do
      Subreddit.destroy_all
      n = 100
      persister = SubredditPersister.new
      expect{
        persister.collect_subreddits(n)
      }.to change {Subreddit.count}.by(n)
    end

    it "persists a large n subreddits to database" do
      Subreddit.destroy_all
      n = 200
      persister = SubredditPersister.new
      expect{
        persister.collect_subreddits(n)
      }.to change {Subreddit.count}.by(n)
    end
  end

end
