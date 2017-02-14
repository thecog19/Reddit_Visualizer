namespace :reddit do
  desc "Continuously run populate_database_job for set period of time"

  S = SubredditPersister.new

  task populate_db: [:environment] do
    queue_subreddit_collection
    queue_subreddit_connection_collection
  end

  def queue_subreddit_collection
    S.delay.collect_subreddits
  end

  def queue_subreddit_connection_collection
    S.delay.collect_subreddit_connections
  end

end

# heroku run rake reddit:populate_db
