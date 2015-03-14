class Forum < ActiveRecord::Base
  belongs_to :dashboard_category
  has_many :topics

  validates :dashboard_category, presence: true
  validates :name, presence: true
  validates :order, uniqueness:  { scope: :dashboard_category }, presence: true
end
