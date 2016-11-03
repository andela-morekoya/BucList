class Token < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :token, presence: true, uniqueness: true

  def is_valid
    Time.now < self.expires_at
  end
end
