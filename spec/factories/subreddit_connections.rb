
FactoryGirl.define do
  factory :subreddit_connection do
    subreddit_from { create(:subreddit, name: "AskReddit" ) }
    subreddit_to { create(:subreddit, name: "politics" ) }
  end
end
