
class SubredditPersister

  def initialize(args = {})
    @subreddit_api = args.fetch(:subreddit_api, RedditApi::Subreddits.new)
    @connector = SubredditConnector.new
    @subreddit_factory = args.fetch(:subreddit_factory, Subreddit)
    @connection_factory = SubredditConnection
  end

  def collect_subreddits(count)
    subreddits_data = subreddit_api.top(count)
    persist_subreddits(subreddits_data, count)
  end

  def collect_subreddit_connections(user_count = 5)
    subreddits = subreddit_factory.where(children_added_at: nil)
    subreddits.each do |subreddit|
      connections = connector.generate_connections(subreddit, user_count)
      persist_subreddit_connections(connections)
    end
  end

  private
  attr_reader :subreddit_api, :connector, :subreddit_factory,
              :connection_factory

  def persist_subreddits(subreddits_data, count)
    subreddits_data.each do |subreddit_data|
      persist_subreddit(subreddit_data)
    end
  end

  def persist_subreddit(subreddit_data)
    subreddit_factory.create(subreddit_data.to_h)
  end

  def persist_subreddit_connections(connections)
    connections.each do |connection|
      persist_subreddit_connection(connection)
    end
  end

  def persist_subreddit_connection(connection_params)
    connection = SubredditConnection.new(connection_params)
    save_and_update_subreddits(connection)
  end

  def save_and_update_subreddits(connection)
    if connection.valid?
      connection.save
      update_parent_subreddit(connection.subreddit_from)
    end
  end

  def update_parent_subreddit(subreddit)
    subreddit.update(children_added_at: Time.now)
  end
end

