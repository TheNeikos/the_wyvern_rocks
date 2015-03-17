class RemoveMemberIdFromTopics < ActiveRecord::Migration
  def change
    remove_reference :topics, :member, index: true
  end
end
