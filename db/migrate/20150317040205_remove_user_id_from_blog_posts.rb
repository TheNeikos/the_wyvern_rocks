class RemoveUserIdFromBlogPosts < ActiveRecord::Migration
  def change
    remove_reference :blog_posts, :user, index: true
  end
end
