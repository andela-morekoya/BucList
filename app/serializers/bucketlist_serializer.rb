class BucketlistSerializer < ActiveModel::Serializer
  # attributes :id, :email, :password_digest
  attributes :id, :name, :date_created, :date_modified

  belongs_to :user
  has_many :items
end
