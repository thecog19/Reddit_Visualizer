
FactoryGirl.define do
  factory :subreddit, aliases: [:subreddit_to, :subreddit_from] do
    subscriber_count ""
    sequence(:url) { |n| "#{n}url" }
    name "AskReddit"
    description "MyText"
  end
end
