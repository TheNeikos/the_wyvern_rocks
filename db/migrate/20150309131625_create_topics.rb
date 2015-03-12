class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :type
      t.integer :user_id
      t.integer :forum_id
      t.string :content

      t.timestamps null: false
    end
  end
end
