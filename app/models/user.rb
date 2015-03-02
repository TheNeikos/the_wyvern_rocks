class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email_address, presence: true, confirmation: true, uniqueness: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email_address_confirmation, presence: true

end
