require "rails_helper"

describe SubredditPersister do

  describe "#collect_subreddits" do
    it "persists n subreddits to database" do
      persister = SubredditPersister.new
      expect{
        persister.collect_subreddits(1)
      }.to change {Subreddit.count}.by(1)
    end

  end

end
