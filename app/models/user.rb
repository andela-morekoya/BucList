require 'json_web_token'

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  before_save { email.downcase! }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }, on: :create

  has_secure_password
  has_many :bucketlists
  has_one :token

  def generate_token
    return nil unless token.blank? || token.expired?

    payload = { user: { id: id, email: email } }
    user_token = JsonWebToken.encode(payload)
    create_token(user_id: id,
                 token: user_token,
                 expires_at: 2.hours.from_now)
  end
end
