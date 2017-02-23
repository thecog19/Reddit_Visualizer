
namespace :reddit do
  desc "Continuously run populate_database_job for set period of time"

  task form_connections: [:environment] do
    persister = SubredditPersister.new
    persister.collect_subreddit_connections
  end
end

