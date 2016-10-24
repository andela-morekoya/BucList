class UserSerializer < ActiveModel::Serializer
  # attributes :id, :email, :password_digest
  attributes :email, :token
end
