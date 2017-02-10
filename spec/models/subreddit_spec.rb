require "rails_helper"

describe Subreddit, type: :model do

  it { is_expected.to have_many(:subreddit_origin_connections) }

  describe "#origin_subreddits" do
    it "can add subreddits to origin subreddits list" do
      from = create(:subreddit)
      to = create(:subreddit)

      to.origin_subreddits << from

      expect(to.origin_subreddits).to include(from)
    end
  end

  it { is_expected.to have_many(:subreddit_destination_connections) }

  describe "#destination_subreddits" do
    it "can add subreddits to destination subreddits list" do
      from = create(:subreddit)
      to = create(:subreddit)

      from.destination_subreddits << to

      expect(from.destination_subreddits).to include(to)
    end
  end

end
