
FactoryGirl.define do
  factory :subreddit, aliases: [:subreddit_to, :subreddit_from] do
    subscriber_count ""
    sequence(:url) { |n| "#{n}url" }
    sequence(:name) { |n| "#{n}subreddit" }
    description "MyText"

    trait :with_connections do
      children_added_at Time.now
      after(:build) do |subreddit|
        create_list :subreddit_connection, 3, subreddit_from: subreddit
      end
    end

  end
end
