class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :posts, foreign_key: 'blog_id', class_name: "BlogPost"
  validates :name, uniqueness: { case_sensitive: false, scope: :user },
      presence: true

  validates :user, presence: true
end
