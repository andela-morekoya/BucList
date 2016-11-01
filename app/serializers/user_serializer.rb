class UserSerializer < ActiveModel::Serializer
  # attributes :id, :email, :password_digest
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> setup serializers
  attributes :email

  has_many :bucketlists
  has_one :token
<<<<<<< HEAD
=======
  attributes :email, :token
>>>>>>> create bucketlist models
=======
>>>>>>> setup serializers
end
