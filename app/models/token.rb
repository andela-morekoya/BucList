class Token < ApplicationRecord
  belongs_to :user
  validates :token, presence: true
  validates_uniqueness_of :token

  def expired?
    Time.now > expires_at
  end

  def self.token_user_id(token)
    result = find_by_token(token)
    result.user_id if result
  end
end
