require 'json_web_token'

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  before_save { email.downcase! }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
<<<<<<< HEAD
<<<<<<< HEAD
  validates :password, length: { minimum: 6 }
<<<<<<< HEAD
  has_secure_password
  has_many :bucketlists
=======
=======
  # validates :password, length: { minimum: 6 }
>>>>>>> write code for user#update

  has_secure_password
>>>>>>> get model tests to pass
=======
  validates :password, length: { minimum: 6 }, on: :create
<<<<<<< HEAD

>>>>>>> refactor code for user#update
=======
  
  has_secure_password
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> create bucketlist models
=======

=======
>>>>>>> setup serializers
  has_many :bucketlists
<<<<<<< HEAD
>>>>>>> add destroy depndency
=======
  has_one :token

  def generate_token
    payload = { user: { id: id, email: email } }
    user_token = JsonWebToken.encode(payload)
    self.create_token(user_id: id, 
                      token: user_token, 
                      expires_at: 2.hours.from_now)
  end
>>>>>>> commit changes in preparation for cherry picking
end
