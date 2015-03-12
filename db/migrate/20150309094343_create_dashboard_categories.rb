class CreateDashboardCategories < ActiveRecord::Migration
  def change
    create_table :dashboard_categories do |t|
      t.string :name
      t.integer :order

      t.timestamps null: false
    end
  end
end
