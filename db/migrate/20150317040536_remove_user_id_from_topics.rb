class RemoveUserIdFromTopics < ActiveRecord::Migration
  def change
    remove_reference :topics, :user, index: true
  end
end
