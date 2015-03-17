class AddMemberIdToTopics < ActiveRecord::Migration
  def change
    add_reference :topics, :member, index: true
    add_foreign_key :topics, :members
  end
end
