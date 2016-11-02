class UserSerializer < ActiveModel::Serializer
  # attributes :id, :email, :password_digest
  attributes :email

  has_many :bucketlists
  has_one :token
end
