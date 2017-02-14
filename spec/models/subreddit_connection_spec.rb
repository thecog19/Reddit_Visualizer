require "rails_helper"

describe SubredditConnection do

  describe "#unique_both_directions" do
    it "checks to see if a connection is unique in both directions" do

      valid_connection = create(:subreddit_connection)


      invalid_connection = build(:subreddit_connection,
                            subreddit_from: valid_connection.subreddit_from,
                            subreddit_to: valid_connection.subreddit_to,)

      expect(invalid_connection.valid?).to be false
    end
  end

end
