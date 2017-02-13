class CreateSubreddits < ActiveRecord::Migration[5.0]
  def change
    create_table :subreddits do |t|
      t.bigint :subscriber_count
      t.string :url
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :subreddits, :url, unique: true
  end
end
