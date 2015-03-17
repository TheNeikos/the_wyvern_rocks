class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :blogs
  has_many :blog_posts


  # Convert username to friendly url format
  def slug
    if name.present?
      name.downcase.gsub(" ", "-").parameterize
    end
  end

  # Change default param for user from id to id-name for friendly urls.
  # When finding in DB, Rails auto calls .to_i on param, which tosses
  # name and doesn't cause any problems in locating user.
  def to_param
    if name.present?
      "#{id}-#{name}"
    end
  end

  ##### FOR OAUTH
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/
    validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    member = signed_in_resource ? signed_in_resource : identity.member

    # Create the user if needed
    if member.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      member = Member.where(:email => email).first if email

      # Create the user if it's a new registration
      if member.nil?
        member = Member.new(
          name: auth.extra.raw_info.name,
          #username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        member.skip_confirmation!
        member.save!
      end
    end

    # Associate the identity with the member if needed
    if identity.member != member
      identity.member = member
      identity.save!
    end
    member
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
  #### END OAUTH
end
