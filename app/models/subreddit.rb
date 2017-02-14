class Subreddit < ApplicationRecord
  has_many :subreddit_origin_connections,
    foreign_key: "subreddit_to_id",
    class_name: "SubredditConnection"
  has_many :origin_subreddits,
    through: :subreddit_origin_connections, source: :subreddit_from

  has_many :subreddit_destination_connections,
    foreign_key: "subreddit_from_id",
    class_name: "SubredditConnection"
  has_many :destination_subreddits,
    through: :subreddit_destination_connections,
    source: :subreddit_to

  API = SubredditApi.new

  def get_weight(parent_id)
    self.subreddit_origin_connections.find_by(subreddit_from_id: parent_id).connection_weight
  end

  def self.find_or_create_by_name(subreddit_name)
    if exists?(name: subreddit_name)
      subreddit = where(name: subreddit_name).last
    else
      subreddit = new(name: subreddit_name,
                      url: "/r/#{subreddit_name}",
                      subscriber_count: API.get_sub_count(subreddit_name))
      subreddit.save
    end
    subreddit
  end

end
