class ItemSerializer < ActiveModel::Serializer
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> convert controller specs to feature tests
  attribute :id
  attribute :name
  attribute :created_at, key: :date_created
  attribute :updated_at, key: :date_modified
  attribute :done
<<<<<<< HEAD

  # belongs_to :bucketlist
=======
  # attributes :id, :email, :password_digest
  attributes :id, :name, :date_created, :date_modified, :done
=======
>>>>>>> convert controller specs to feature tests

  belongs_to :bucketlists
>>>>>>> setup serializers
end
