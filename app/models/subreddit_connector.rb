
class SubredditConnector

  def initialize(args = {})
    @users_api = args.fetch(:users_api, RedditApi::Users.new)
    @comments_api = args.fetch(:comments_api, RedditApi::Comments.new)
  end

  def generate_connections(subreddit, user_count, connections = 5)
    posters = users_api.top_posters(subreddit, user_count)
    scores = get_scores(posters, connections)
    build_connections(subreddit, scores)
  end

  private
  attr_reader :users_api, :comments_api

  def get_scores(posters, connections)
    all_scores = get_all_scores(posters)
    sorted_scores = sort_scores(all_scores)
p "BELOW SORTED SCORES"
    top_scores(sorted_scores, connections)
  end

  def get_all_scores(posters)
    scores = Hash.new(0)
    posters.each do |poster|
p poster
      subreddits = comments_api.most_recent_subreddits(poster, 10)
p subreddits
      calculate_scores(subreddits, scores)
    end
    scores
  end

  def sort_scores(scores)
    scores.sort_by { |subreddit, score| score }
  end

  def top_scores(sorted_scores, connections)
    if sorted_scores.length < connections
      sorted_scores.to_h
    else
      sorted_scores[-connections..-1].to_h
    end
  end

  def calculate_scores(subreddits, scores)
    subreddits.each do |subreddit|
      scores[subreddit] += 1
    end
  end

  def build_connections(subreddit, scores)
    scores.map do |subreddit_name, score|
      build_connection(subreddit, subreddit_name, score)
    end
  end

  def build_connection(subreddit, subreddit_name, score)
    {
      subreddit_from_id: subreddit.id,
      subreddit_to_id: Subreddit.find_or_fetch_by_name(subreddit_name).id,
      connection_weight: score
    }
  end

end
