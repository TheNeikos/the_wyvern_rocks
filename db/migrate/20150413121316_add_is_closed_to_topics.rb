class AddIsClosedToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :closed_at, :datetime
    add_index :topics, :closed_at
  end
end
