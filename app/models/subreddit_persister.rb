class SubredditPersister

  def initialize(args = {})
    @api = args.fetch(:api, SubredditApi.new)
  end

  def collect_subreddits(n = 200)
    subreddits = api.top_subreddits(n)
    persist_subreddits(subreddits)
  end

  def collect_subreddit_connections(user_count = 1)
    subreddit_connections = generate_all_subreddit_connections(user_count)
    persist_subreddit_connections(subreddit_connections)
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
      connection = SubredditConnection.new(subreddit_connection)
      connection.save if connection.valid?
    end

    def generate_all_subreddit_connections(user_count)
      Subreddit.all.each do |subreddit|
        generate_subreddit_connections(subreddit, user_count)
      end
    end

    def generate_subreddit_connections(subreddit, user_count)
      puts subreddit
      authors = api.get_subreddit_authors(subreddit, user_count)
      scores = Hash.new(0)
      authors.each do |author|
        subreddits = api.get_subreddits_commented_on(author)
        calculate_scores(subreddits, scores)
      end
      scores
      # scores = {
      #  "askReddit" => 120123
      #  "trees" => 12
      #  ... 100 times
      # }
      # top 5 scores each do |name, score|
      # second_sub = SubredditConnect.find_or_fetch_by_name(name)
      # connection_params = { subreddit_from_id: subreddit.id, subreddit_to_id: second_sub.id, connection_weight:  score }
      # persist_subreddit_connection(connection_params)
    end

    def calculate_scores(subreddits, scores)
      subreddits.each do |subreddit|
        scores[subreddit] += 1
      end
    end

end

s = SubredditPersister.new

#s.collect_subreddits
#s.collect_subreddit_connections
