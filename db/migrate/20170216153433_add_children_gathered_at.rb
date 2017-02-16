class AddChildrenGatheredAt < ActiveRecord::Migration[5.0]
  def change
    add_column :subreddits, :children_added_at, :datetime
  end
end
