class ItemSerializer < ActiveModel::Serializer
<<<<<<< HEAD
  attribute :id
  attribute :name
  attribute :created_at, key: :date_created
  attribute :updated_at, key: :date_modified
  attribute :done

  # belongs_to :bucketlist
=======
  # attributes :id, :email, :password_digest
  attributes :id, :name, :date_created, :date_modified, :done

  belongs_to :bucketlists
>>>>>>> setup serializers
end
