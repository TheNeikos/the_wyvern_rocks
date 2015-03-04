class CreateGlobalSettings < ActiveRecord::Migration
  def change
    create_table :global_settings do |t|
      t.string :name
      t.string :value
      t.string :description
      t.integer :setting_type, default: 0

      t.timestamps null: false
    end
  end
end
