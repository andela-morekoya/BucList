class Item < ApplicationRecord
<<<<<<< HEAD
  belongs_to :bucketlist, dependent: :destroy # , counter_cache: true
  validates :name, presence: true
=======
>>>>>>> create bucketlist models
end
