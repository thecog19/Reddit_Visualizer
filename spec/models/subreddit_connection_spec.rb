require "rails_helper"

describe SubredditConnection do

  describe "#unique_both_directions" do
    it "checks to see if a connection is unique in both directions" do
      create(:subreddit_connection,
             subreddit_from_id: 1,
             subreddit_to_id: 2)

      invalid_connection = build(:subreddit_connection,
                            subreddit_from_id: 2,
                            subreddit_to_id: 1)

      expect(invalid_connection.valid?).to be false
    end
  end

end
