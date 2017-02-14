class PopulateDatabaseJob < ApplicationJob
  queue_as :default

  def perform(*args)
    s = SubredditPersister.new
    # get subreddits until (50) subreddits
    s.collect_subreddits
    # get subreddit connections
    s.collect_subreddit_connections
    # repeat
  end
end
