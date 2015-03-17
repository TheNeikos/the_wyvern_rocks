class Blog < ActiveRecord::Base
  belongs_to :member
  has_many :posts, foreign_key: 'blog_id', class_name: "BlogPost"
  validates :name, uniqueness: { case_sensitive: false, scope: :member },
      presence: true

  validates :member, presence: true
end
