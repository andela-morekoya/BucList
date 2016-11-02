class Item < ApplicationRecord
  belongs_to :bucketlist, dependent: :destroy # , counter_cache: true
  validates :name, presence: true
end
