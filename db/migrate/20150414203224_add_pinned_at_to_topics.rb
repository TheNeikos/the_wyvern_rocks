class AddPinnedAtToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :pinned_at, :datetime
    add_index :topics,  :pinned_at
  end
end
