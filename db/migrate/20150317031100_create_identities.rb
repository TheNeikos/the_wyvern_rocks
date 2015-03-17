class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :member, index: true
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
    add_foreign_key :identities, :members
  end
end
