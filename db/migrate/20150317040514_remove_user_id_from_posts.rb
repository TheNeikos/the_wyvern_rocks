class RemoveUserIdFromPosts < ActiveRecord::Migration
  def change
    remove_reference :posts, :user, index: true
  end
end
