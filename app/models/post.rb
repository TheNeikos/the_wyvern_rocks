class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :member

  validates :topic, presence: true
  validates :member, presence: true
  validates :content, presence: true

  after_save do
    self.topic.update_column(:last_post_created_at, self.created_at)
  end
end
