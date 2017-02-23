require "rails_helper"

describe SubredditConnection do

  it { is_expected.to belong_to(:subreddit_from) }
  it { is_expected.to belong_to(:subreddit_to) }

  it "is unique from the given subreddit to another" do
    valid_connection = create(:subreddit_connection)
    invalid_connection = build(:subreddit_connection,
                               subreddit_from: valid_connection.subreddit_from,
                               subreddit_to: valid_connection.subreddit_to)

    expect(invalid_connection).to_not be_valid
  end

  it "is not connect a subreddit to itself" do
    subreddit = create(:subreddit)
    invalid_connection = build(:subreddit_connection,
                               subreddit_from: subreddit,
                               subreddit_to: subreddit)

    expect(invalid_connection).to_not be_valid
  end

end

