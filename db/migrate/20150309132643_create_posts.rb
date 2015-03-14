class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id
      t.integer :topic_id
      t.string :type

      t.timestamps null: false
    end
  end
end
