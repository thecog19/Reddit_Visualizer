
namespace :reddit do
  desc "Continuously run populate_database_job for set period of time"

  task gather_subreddits: [:environment] do
    s = SubredditPersister.new
    s.delay.collect_subreddits(1000)
  end
end

