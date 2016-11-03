class Token < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :token, presence: true 
  validates_uniqueness_of :token

  def is_valid
    Time.now < self.expires_at
  end
end
