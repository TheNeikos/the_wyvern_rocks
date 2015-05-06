class Topic < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :forum
  belongs_to :user
  has_many :posts

  validates :name, presence: true
  validates :content, presence: true
  validates :forum, presence: true
  validates :user, presence: true

  scope :ordered, -> { order(last_post_created_at: "DESC") }

  before_save(on: :create) do
    self.last_post_created_at = DateTime.now
  end

  def last_post_time
    self.last_post_created_at
  end

  def path_variables
    self.persisted? ? self : [self.forum, self]
  end

  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end
end
