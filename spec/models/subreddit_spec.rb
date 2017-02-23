require "rails_helper"

describe Subreddit do

  it { is_expected.to have_many(:subreddit_origin_connections) }
  it { is_expected.to have_many(:origin_subreddits) }
  it { is_expected.to have_many(:subreddit_destination_connections) }
  it { is_expected.to have_many(:destination_subreddits) }

  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_uniqueness_of(:url) }

  describe "#related_subreddits" do
    it "returns n subreddit connections" do
      subreddit = build(:subreddit, :with_connections)

      subreddits = subreddit.related_subreddits(2)

      expect(subreddits.length).to eq(2)
    end

    it "returns SubredditConnections" do
      subreddit = build(:subreddit, :with_connections)

      subreddits = subreddit.related_subreddits(2)
      all_subreddits = subreddits.all? { |s| s.is_a?(Subreddit) }

      expect(all_subreddits).to be true
    end
  end

end
