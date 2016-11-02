class BucketlistSerializer < ActiveModel::Serializer
<<<<<<< HEAD
<<<<<<< HEAD
  attribute :id
  attribute :name
  attribute :items do
    object.items.each do |item|
=======
  attribute :id
  attribute :name
  attribute :items do
<<<<<<< HEAD
    for item in object.items
>>>>>>> convert controller specs to feature tests
=======
    object.items.each do |item|
>>>>>>> fix rubocop issues
      ItemSerializer.new(item).attributes
    end
  end
  attribute :created_at, key: :date_created
  attribute :updated_at, key: :date_modified
  attribute (:user_id).to_s, key: :created_by
<<<<<<< HEAD
=======
  # attributes :id, :email, :password_digest
  attributes :id, :name, :date_created, :date_modified

  belongs_to :user
  has_many :items
>>>>>>> setup serializers
=======
>>>>>>> convert controller specs to feature tests
end
