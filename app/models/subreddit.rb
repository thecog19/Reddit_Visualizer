class Subreddit < ApplicationRecord
  has_many :subreddit_origin_connections,
    foreign_key: "subreddit_to_id",
    class_name: "SubredditConnection",
    dependent: :destroy
  has_many :origin_subreddits,
    through: :subreddit_origin_connections, source: :subreddit_from

  has_many :subreddit_destination_connections,
    foreign_key: "subreddit_from_id",
    class_name: "SubredditConnection",
    dependent: :destroy
  has_many :destination_subreddits,
    through: :subreddit_destination_connections,
    source: :subreddit_to
  validates :url, uniqueness: true


  API = SubredditApi.new

  def get_top_connections(limit)
    top_connections = subreddit_destination_connections.order(connection_weight: :desc).limit(limit)
    top_connections.map do |connection|
      connection.subreddit_to
    end
  end

  def get_weight(parent_id)
    self.subreddit_origin_connections.find_by(subreddit_from_id: parent_id).connection_weight
  end

  def has_children
    !!children_added_at
  end

  def self.find_or_fetch_by_name(subreddit_name)
    if exists?(name: subreddit_name)
      subreddit = where(name: subreddit_name).last
    else
      subreddit = new(API.get_sub_data(subreddit_name))
      subreddit.save
    end
    subreddit
  end

  def find_path(id_start, id_end)
    start_subreddit = Subreddit.find_by(id: id_start)
    end_subreddit = Subreddit.find_by(id: id_end)

    subreddits = {}
    queue = []

    subreddits[id_start] = true
    unless end_subreddit
      return 'Node does not exist'
    else
      queue + start_subreddit.children
      queue.children.each do |child|
        next if subreddits[child.id]
        next if child.subscriber_count > 11_000_000
        queue.push(child)
        return if child == end_subreddit
      end
    end
  end

end
