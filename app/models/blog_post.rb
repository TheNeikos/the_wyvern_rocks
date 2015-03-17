class BlogPost < ActiveRecord::Base
  belongs_to :blog
  belongs_to :member

  validates :name, presence: true
  validates :content, presence: true
  validates :member, presence: true
  validates :blog, presence: true
end
