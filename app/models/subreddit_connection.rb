
class SubredditConnection < ApplicationRecord
  belongs_to :subreddit_from,
    foreign_key: "subreddit_from_id",
    class_name: "Subreddit"
  belongs_to :subreddit_to,
    foreign_key: "subreddit_to_id",
    class_name: "Subreddit"

  validate :unique_both_directions

  def unique_both_directions
    if SubredditConnection.exists?(subreddit_from_id: subreddit_from_id,
        subreddit_to_id: subreddit_to_id) ||
       SubredditConnection.exists?(subreddit_from_id: subreddit_to_id,
                                   subreddit_to_id: subreddit_from_id)
      errors.add(:connection, "must be unique in both directions")
    end
  end

end
