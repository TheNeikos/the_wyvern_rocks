class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  #validates :email, confirmation: true

  validates :password, if: :old_password_matches, on: :update, presence: true

  attr_accessor :old_password

  has_many :blogs
  has_many :blog_posts

  private

  def old_password_matches
    return false if old_password.nil?
    return false unless authenticate(old_password)
    true
  end

  def update_password

  end

end
