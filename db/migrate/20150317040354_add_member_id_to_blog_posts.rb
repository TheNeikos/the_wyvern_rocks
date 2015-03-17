class AddMemberIdToBlogPosts < ActiveRecord::Migration
  def change
    add_reference :blog_posts, :member, index: true
    add_foreign_key :blog_posts, :members
  end
end
