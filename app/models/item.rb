
class Item < ApplicationRecord
  belongs_to :bucketlist, dependent: :destroy
  validates :name, presence: true
end
