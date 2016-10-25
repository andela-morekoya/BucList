
class Item < ApplicationRecord
<<<<<<< HEAD
  belongs_to :bucketlist, dependent: :destroy
=======
  belongs_to :bucketlist, dependent: :destroy # , counter_cache: true
>>>>>>> add destroy depndency
  validates :name, presence: true
end
