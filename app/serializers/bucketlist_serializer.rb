class BucketlistSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name
  attribute :created_at, key: :date_created
  attribute :updated_at, key: :date_modified
  attribute (:user_id).to_s, key: :created_by
  has_many :items
end
