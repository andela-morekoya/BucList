class ItemSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name
  attribute :created_at, key: :date_created
  attribute :updated_at, key: :date_modified
  attribute :done

  belongs_to :bucketlists
end
