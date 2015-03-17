class RemoveMemberIdFromIdentities < ActiveRecord::Migration
  def change
    remove_reference :identities, :member, index: true
  end
end
