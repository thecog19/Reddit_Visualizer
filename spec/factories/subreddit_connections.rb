
FactoryGirl.define do
  factory :subreddit_connection do
    sequence(:subreddit_from_id ) { |n| n }
    sequence(:subreddit_to_id ) { |n| n + 1 }
  end
end
