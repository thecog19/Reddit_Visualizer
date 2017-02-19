
class SubredditPersister
  attr_reader :failures

  CAPTURE_RATE = 100
  REQUEST_LIMIT = 5

  def initialize(args = {})
    @api = args.fetch(:api, SubredditApi.new)
    @captured = 0
    @captured_this_iteration = 0
    @failures = 0
    @connector = SubredditConnector.new(api: api)
  end

  def collect_subreddits(count)
    while captured < count && failures < REQUEST_LIMIT
      subreddits_data = api.top_subreddits(CAPTURE_RATE, captured)
      persist_subreddits(subreddits_data, count)
      update_failures
    end
  end

  def collect_subreddit_connections(user_count = 10)
    subreddits = Subreddit.where(children_added_at: nil)
    subreddits.each do |subreddit|
      connections = connector.generate_connections(subreddit, user_count)
      persist_subreddit_connections(connections)
    end
  end

  protected
  attr_accessor :captured, :captured_this_iteration
  attr_writer :failures
  private
  attr_reader :api, :connector

  def persist_subreddits(subreddits_data, count)
    self.captured_this_iteration = 0
    subreddits_data.each do |subreddit_data|
      persist_subreddit(subreddit_data)
      break if captured == count
    end
  end

  def persist_subreddit(subreddit_data)
    subreddit = Subreddit.new(subreddit_data)
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
