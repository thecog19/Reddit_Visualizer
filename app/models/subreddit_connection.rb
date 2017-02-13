
class SubredditConnection < ApplicationRecord
  belongs_to :subreddit_from,
    foreign_key: "subreddit_from_id",
    class_name: "Subreddit"
  belongs_to :subreddit_to,
    foreign_key: "subreddit_to_id",
    class_name: "Subreddit"
end
