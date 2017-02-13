class SubredditPersister

  def initialize(args = {})
    @api = args.fetch(:api, SubredditApi.new)
  end

  def collect_subreddits(n = 200)
    subreddits = api.top_subreddits(n)
    persist_subreddits(subreddits)
  end

  def collect_subreddit_connections(user_count = 25)
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

    def generate_all_subreddit_connections(user_count)
      Subreddit.all.each do |subreddit|
        generate_subreddit_connections(subreddit, user_count)
      end
    end

    def generate_subreddit_connections(subreddit, user_count)
      authors = api.get_subreddit_authors(subreddit, user_count)
    end

end
