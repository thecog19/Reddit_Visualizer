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

    def persist_subreddit_connections(subreddit_connections)
puts subreddit_connections
    end

    def generate_all_subreddit_connections(user_count)
      Subreddit.all.each do |subreddit|
        generate_subreddit_connections(subreddit, user_count)
      end
    end

    def generate_subreddit_connections(subreddit, user_count)
      authors = api.get_subreddit_authors(subreddit, user_count)
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

end

#s = SubredditPersister.new

#s.collect_subreddits
#s.collect_subreddit_connections
