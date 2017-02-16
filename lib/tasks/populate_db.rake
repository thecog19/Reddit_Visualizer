namespace :reddit do
  desc "Continuously run populate_database_job for set period of time"

  task populate_db: [:environment] do
    s = SubredditPersister.new
    s.delay.collect_subreddits(1000)
    s.delay.collect_subreddit_connections(100)
  end
end

# heroku run rake reddit:populate_db
