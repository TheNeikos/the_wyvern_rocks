class RemoveMemberIdFromPosts < ActiveRecord::Migration
  def change
    remove_reference :posts, :member, index: true
  end
end
