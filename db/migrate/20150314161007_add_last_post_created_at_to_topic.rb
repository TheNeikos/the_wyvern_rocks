class AddLastPostCreatedAtToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :last_post_created_at, :datetime, default: DateTime.now
  end
end
