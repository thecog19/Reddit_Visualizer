
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
  validates :name, uniqueness: true
  validates :url, uniqueness: true

  API = RedditApi::Subreddits.new

  def related_subreddits(limit)
    related_subreddits = subreddit_destination_connections
                      .order(connection_weight: :desc)
                      .limit(limit)
    related_subreddits.map do |connection|
      connection.subreddit_to
    end
  end

  def get_weight(parent_id)
    self.subreddit_origin_connections
        .find_by(subreddit_from_id: parent_id)
        .connection_weight
  end

  def has_children
    !!children_added_at
  end

  def self.find_or_fetch_by_name(subreddit_name)
    if exists?(name: subreddit_name)
      find_by(name: subreddit_name)
    else
      subreddit_data = API.data_for(subreddit_name)
      create(subreddit_data.to_h)
    end
  end

  def self.find_by_id_or_name(params)
    if params[:id] == '0'
      @subreddit = Subreddit.find_by(name: params[:name])
    else
      @subreddit = Subreddit.find_by(id: params[:id])
    end
  end

end
