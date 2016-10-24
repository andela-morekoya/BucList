class UserSerializer < ActiveModel::Serializer
  # attributes :id, :email, :password_digest
<<<<<<< HEAD
  attributes :email

  has_many :bucketlists
  has_one :token
=======
  attributes :email, :token
>>>>>>> create bucketlist models
end
