class BlogPost < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user

  validates :name, presence: true
  validates :content, presence: true
  validates :user, presence: true
  validates :blog, presence: true

  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end
end
