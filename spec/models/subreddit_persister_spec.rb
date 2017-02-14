require "rails_helper"

describe SubredditPersister do

  describe "#collect_subreddits" do
    it "persists n subreddits to database" do
      skip
      n = 1
      persister = SubredditPersister.new
      expect{
        persister.collect_subreddits(n)
      }.to change {Subreddit.count}.by(n)
    end
  end

end
