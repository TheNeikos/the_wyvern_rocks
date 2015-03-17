class AddUserIdToBlogPosts < ActiveRecord::Migration
  def change
    add_reference :blog_posts, :user, index: true
    add_foreign_key :blog_posts, :users
  end
end
