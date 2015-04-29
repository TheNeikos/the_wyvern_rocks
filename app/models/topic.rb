class Topic < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :forum
  belongs_to :user
  has_many :posts

  validates :name, presence: true
  validates :content, presence: true
  validates :forum, presence: true
  validates :user, presence: true

  def last_post_time
    posts.empty? ?  self.created_at : posts.last.created_at
  end

  def path_variables
    self.persisted? ? self : [self.forum, self]
  end

  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end
end
