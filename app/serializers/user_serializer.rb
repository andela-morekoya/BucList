class UserSerializer < ActiveModel::Serializer
  attribute :email
  has_one :token
end
