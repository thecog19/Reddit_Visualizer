class HeaderImage < ActiveRecord::Migration[5.0]
  def change
    add_column :subreddits, :subreddit_icon, :text
  end
end
