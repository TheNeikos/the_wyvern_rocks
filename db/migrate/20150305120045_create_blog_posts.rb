class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.references :blog, index: true
      t.references :user, index: true
      t.string :name
      t.string :content
      t.boolean :published

      t.timestamps null: false
    end
    add_foreign_key :blog_posts, :blogs
    add_foreign_key :blog_posts, :users
  end
end
