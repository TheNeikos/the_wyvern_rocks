class Topic < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user
  has_many :posts

  validates :name, presence: true
  validates :content, presence: true
  validates :forum, presence: true
  validates :user, presence: true

  def last_post_time
    posts.last.created_at
  end
end
