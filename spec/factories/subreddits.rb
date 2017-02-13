FactoryGirl.define do
  factory :subreddit do
    subscriber_count ""
    sequence(:url) { |n| "#{n}url" }
    name "MyString"
    description "MyText"
  end
end
