class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.references :user, index: true
      t.string :name
      t.string :description

      t.timestamps null: false
    end
    add_foreign_key :blogs, :users
  end
end
