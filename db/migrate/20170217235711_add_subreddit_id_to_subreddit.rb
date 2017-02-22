class AddSubredditIdToSubreddit < ActiveRecord::Migration[5.0]

  def up
    add_column :subreddits, :reddit_id, :string
  end

  def down
    remove_column :subreddits, :reddit_id
  end

end
