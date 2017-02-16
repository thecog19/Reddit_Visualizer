class RemoveUnique < ActiveRecord::Migration[5.0]
  def change
    remove_index :subreddit_connections, name: "to_from"
    add_index :subreddit_connections,
      [:subreddit_to_id, :subreddit_from_id],
      name: "to_from"
  end
end
