class Bucketlist < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user, dependent: :destroy
  has_many :items
  validates :name, presence: true

  def self.search(query)
    where('lower(name) like ?', "%#{query.downcase}%")
  end
=======
>>>>>>> create bucketlist models
end
