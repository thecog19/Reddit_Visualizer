class RenameSubredditIcon < ActiveRecord::Migration[5.0]

  def up
    rename_column :subreddits, :subreddit_icon, :icon
  end

  def down
    rename_column :subreddits, :icon, :subreddit_icon
  end

end
