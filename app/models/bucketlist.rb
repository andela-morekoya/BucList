class Bucketlist < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :items
  validates :name, presence: true
end

