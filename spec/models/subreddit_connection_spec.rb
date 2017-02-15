require "rails_helper"

describe SubredditConnection do

  describe "#unique_both_directions" do
    it "checks to see if a connection is unique in both directions" do

      valid_connection = create(:subreddit_connection)


      invalid_connection = build(:subreddit_connection,
                            subreddit_from: valid_connection.subreddit_from,
                            subreddit_to: valid_connection.subreddit_to)

      expect(invalid_connection).to_not be_valid
    end
  end

  describe '#not_self_referencing' do
    it 'does not allow a self-referencing connection' do
      subreddit = create(:subreddit)
      
      invalid_connection = build(:subreddit_connection,
                            subreddit_from: subreddit,
                            subreddit_to: subreddit)

      expect(invalid_connection).to_not be_valid
    end
  end

end
