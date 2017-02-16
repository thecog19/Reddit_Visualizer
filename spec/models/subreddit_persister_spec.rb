require "rails_helper"

describe SubredditPersister do

  describe "#collect_subreddits" do
    it "persists n subreddits to database" do
      Subreddit.destroy_all
      n = 100
      persister = SubredditPersister.new
      expect{
        persister.collect_subreddits(n)
      }.to change {Subreddit.count}.by(n)
    end

    it "persists a large n subreddits to database" do
      Subreddit.destroy_all
      n = 200
      persister = SubredditPersister.new
      expect{
        persister.collect_subreddits(n)
      }.to change {Subreddit.count}.by(n)
    end
  end

  describe '#collect_subreddit_connections' do


    it 'persists subreddit connections to the db' do
      SubredditConnection.destroy_all
      subreddit = create(:subreddit)
      subreddit2 = create(:subreddit, name: 'New Subreddit')

      api = double()
      allow(api).to receive(:get_subreddit_authors).and_return({ bob: 7 })
      allow(api).to receive(:get_subreddits_commented_on).and_return([subreddit2.name])

      persister = SubredditPersister.new(api: api)
      expect{
        persister.collect_subreddit_connections(1)
      }.to change { SubredditConnection.count }.by(1)
    end

    it 'only adds connections to subreddits that need them'
      # create subreddit with 'children_added_at' not null
      # run function
      # record should not be updated
  end

end
