class RemoveMemberIdFromBlogs < ActiveRecord::Migration
  def change
    remove_reference :blogs, :member, index: true
  end
end
