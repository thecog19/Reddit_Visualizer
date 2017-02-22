
namespace :reddit do
  desc "Continuously run populate_database_job for set period of time"

  task form_connections: [:environment] do
    s = SubredditPersister.new
    s.collect_subreddit_connections(50)
  end
end
