
class SubredditPersister
  attr_reader :captured, :failures

  CAPTURE_RATE = 100
  DEFAULT_REQUEST_LIMIT = 2

  def initialize(args = {})
    @subreddit_api = args.fetch(:subreddit_api, RedditApi::Subreddits.new)
    @captured = 0
    @captured_this_iteration = 0
    @failures = args.fetch(:failures, 0)
    @request_limit = args.fetch(:limit, DEFAULT_REQUEST_LIMIT)
    @connector = SubredditConnector.new
  end

  def collect_subreddits(count)
    while captured < count && failures < request_limit
      subreddits_data = subreddit_api.top(count)
      persist_subreddits(subreddits_data, count)
      update_failures
    end
    reset_collection_metrics
  end

  def collect_subreddit_connections(user_count = 5)
    subreddits = Subreddit.where(children_added_at: nil)
    subreddits.each do |subreddit|
      connections = connector.generate_connections(subreddit, user_count)
      persist_subreddit_connections(connections)
    end
  end

  protected
  attr_accessor :captured_this_iteration
  attr_writer :captured, :failures
  private
  attr_reader :subreddit_api, :connector, :request_limit

  def persist_subreddits(subreddits_data, count)
    self.captured_this_iteration = 0
    subreddits_data.each do |subreddit_data|
      persist_subreddit(subreddit_data)
      break if captured == count
    end
  end

  def persist_subreddit(subreddit_data)
    subreddit = Subreddit.new(subreddit_data.to_h)
    if subreddit.valid?
      subreddit.save
      self.captured += 1
      self.captured_this_iteration += 1
    end
  end

  def update_failures
    if captured_this_iteration.zero?
      self.failures += 1
    end
  end

  def reset_collection_metrics
    self.captured = 0
    self.failures = 0
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

