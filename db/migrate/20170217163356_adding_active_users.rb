class AddingActiveUsers < ActiveRecord::Migration[5.0]
   def change
    add_column :subreddits, :category, :string
    add_column :subreddits, :active_users, :integer
    add_column :subreddits, :nsfw, :boolean
  end
end
