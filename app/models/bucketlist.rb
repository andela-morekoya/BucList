class Bucketlist < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
  belongs_to :user, dependent: :destroy
  has_many :items
  validates :name, presence: true

  def self.search(query)
    where('lower(name) like ?', "%#{query.downcase}%")
  end
=======
>>>>>>> create bucketlist models
=======
  belongs_to :user, dependent: :destroy
  has_many :items
  validates :name, presence: true
>>>>>>> add destroy depndency
end

