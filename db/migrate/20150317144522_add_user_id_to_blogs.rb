class AddUserIdToBlogs < ActiveRecord::Migration
  def change
    add_reference :blogs, :user, index: true
    add_foreign_key :blogs, :users
  end
end
