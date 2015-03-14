class DashboardCategory < ActiveRecord::Base
  has_many :forums

  validates :name, presence: true
  validates :order, presence: true, uniqueness: true
end
