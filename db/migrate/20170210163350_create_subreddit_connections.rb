class CreateSubredditConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :subreddit_connections do |t|
      t.integer :subreddit_from_id
      t.integer :subreddit_to_id
      t.timestamps
    end
    add_index :subreddit_connections,
      [:subreddit_from_id, :subreddit_to_id],
      unique: true,
      name: "from_to"
    add_index :subreddit_connections,
      [:subreddit_to_id, :subreddit_from_id],
      unique: true,
      name: "to_from"
  end
end
