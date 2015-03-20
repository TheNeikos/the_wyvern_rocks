class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  validates :topic, presence: true
  validates :user, presence: true
  validates :content, presence: true

  after_save do
    self.topic.update_column(:last_post_created_at, self.created_at)
  end

  def path_variables
    self.persisted? ? self : [self.topic, self]
  end
end
