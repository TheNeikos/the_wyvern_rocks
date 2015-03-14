class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.string :order
      t.integer :dashboard_category_id

      t.timestamps null: false
    end
  end
end
