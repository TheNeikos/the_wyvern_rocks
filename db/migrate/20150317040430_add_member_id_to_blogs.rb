class AddMemberIdToBlogs < ActiveRecord::Migration
  def change
    add_reference :blogs, :member, index: true
    add_foreign_key :blogs, :members
  end
end
