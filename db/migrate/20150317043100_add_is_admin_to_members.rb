class AddIsAdminToMembers < ActiveRecord::Migration
  def change
    add_column :members, :is_admin, :boolean
  end
end
