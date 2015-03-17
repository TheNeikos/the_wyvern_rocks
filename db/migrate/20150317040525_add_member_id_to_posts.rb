class AddMemberIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :member, index: true
    add_foreign_key :posts, :members
  end
end
