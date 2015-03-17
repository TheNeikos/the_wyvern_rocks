class RemoveUserIdFromBlogs < ActiveRecord::Migration
  def change
    remove_reference :blogs, :user, index: true
  end
end
