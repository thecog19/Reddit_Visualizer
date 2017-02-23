
class SubredditConnection < ApplicationRecord
  belongs_to :subreddit_from,
    foreign_key: "subreddit_from_id",
    class_name: "Subreddit"
  belongs_to :subreddit_to,
    foreign_key: "subreddit_to_id",
    class_name: "Subreddit"
  validate :unique_from_to
  validate :not_self_referencing

  private
  def unique_from_to
    if SubredditConnection.exists?(subreddit_from_id: subreddit_from_id,
                                   subreddit_to_id: subreddit_to_id)
      errors.add(:connection, "must not already posses that child")
    end
  end

  def not_self_referencing
    if subreddit_to_id == subreddit_from_id
      errors.add(:connection, "can not be self referencing")
    end
  end

end
