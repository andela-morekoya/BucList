class UserSerializer < ActiveModel::Serializer
<<<<<<< HEAD
  # attributes :id, :email, :password_digest
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> setup serializers
=======
>>>>>>> finish authentication implemantation
  attributes :email
  has_one :token
<<<<<<< HEAD
=======
  attributes :email, :token
>>>>>>> create bucketlist models
=======
>>>>>>> setup serializers
end
