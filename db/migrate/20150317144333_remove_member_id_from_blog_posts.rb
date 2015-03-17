class RemoveMemberIdFromBlogPosts < ActiveRecord::Migration
  def change
    remove_reference :blog_posts, :member, index: true
  end
end
