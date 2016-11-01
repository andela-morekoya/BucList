class ItemSerializer < ActiveModel::Serializer
  # attributes :id, :email, :password_digest
  attributes :id, :name, :date_created, :date_modified, :done

  belongs_to :bucketlists
end
