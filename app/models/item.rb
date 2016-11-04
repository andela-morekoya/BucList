
class Item < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
  belongs_to :bucketlist, dependent: :destroy
=======
  belongs_to :bucketlist, dependent: :destroy # , counter_cache: true
>>>>>>> add destroy depndency
=======
  belongs_to :bucketlist, dependent: :destroy
>>>>>>> finish authentication implemantation
  validates :name, presence: true
end
