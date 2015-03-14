class AddNameToMember < ActiveRecord::Migration
  def change
    add_column :members, :name, :text
  end
end
