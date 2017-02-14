
class SubredditPersister

  def initialize(args = {})
    @api = args.fetch(:api, SubredditApi.new)
  end

  def collect_subreddits(total = 100)
    raise ArgumentError unless total % 100.0 == 0
    captured = 0
    capture_rate = 100
    while captured < total
      offset = captured
      subreddits = api.top_subreddits(capture_rate, offset)
      persist_subreddits(subreddits)
      captured += capture_rate
    end
  end

  def collect_subreddit_connections(user_count = 20)
    Subreddit.all.each do |subreddit|
      subreddit_connections = generate_subreddit_connections(subreddit, user_count)
      persist_subreddit_connections(subreddit_connections)
    end
  end

  private

  attr_reader :api

  def persist_subreddits(subreddits)
    subreddits.each do |subreddit|
      persist_subreddit(subreddit)
    end
  end

  def persist_subreddit(subreddit_data)
    subreddit = Subreddit.new(subreddit_data)
    subreddit.save if subreddit.valid?
  end

  def persist_subreddit_connections(connections)
    connections.each do |connection|
      persist_subreddit_connection(connection)
    end
  end

  def persist_subreddit_connection(connection_params)
    connection = SubredditConnection.new(connection_params)
    connection.save if connection.valid?
  end

  # def generate_all_subreddit_connections(user_count)
  #   Subreddit.all.each do |subreddit|
  #     subreddit_connection = generate_subreddit_connections(subreddit, user_count)
  #     persist_subreddit_connection(subreddit_connection)
  #   end
  # end

  def generate_subreddit_connections(subreddit, user_count)
    authors = api.get_subreddit_authors(subreddit, user_count)
    scores = get_scores(authors, 5)
    build_connections(scores, subreddit)
  end

  def get_scores(authors, limit = 5)
    all_scores = get_all_scores(authors)
    sorted_scores = all_scores.sort_by { |subreddit, score| score  }
    sorted_scores[-limit..-1].to_h
  end

  def get_all_scores(authors)
    scores = Hash.new(0)
    authors.each do |author|
      subreddits = api.get_subreddits_commented_on(author)
      calculate_scores(subreddits, scores)
    end
    scores
  end

  def calculate_scores(subreddits, scores)
    subreddits.each do |subreddit|
      scores[subreddit] += 1
    end
  end

  def build_connections(scores, subreddit)
    scores.map do |subreddit_name, score|
      {subreddit_from_id: subreddit.id,
       subreddit_to_id: Subreddit.find_or_create_by_name(subreddit_name).id,
       connection_weight: score}
    end
  end
end

s = SubredditPersister.new
s.collect_subreddits
s.collect_subreddit_connections
