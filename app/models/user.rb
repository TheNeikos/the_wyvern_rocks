class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email_address, presence: true, confirmation: true, uniqueness: true
  validates :email_address_confirmation, presence: true

end
