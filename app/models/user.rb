class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email_address, presence: true, uniqueness: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email_address, confirmation: true
  validates :email_address_confirmation, presence: true, on: :create

  validates :password, if: :old_password_matches, on: :update, presence: true

  attr_accessor :old_password

  private

  def old_password_matches
    return false if old_password.nil?
    return false unless authenticate(old_password)
    true
  end

  def update_password

  end

end
