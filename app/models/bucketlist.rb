class Bucketlist < ApplicationRecord
  MAXIMUM_LIMIT = 100
  DEFAULT_LIMIT = 20

  belongs_to :user
  has_many :items, dependent: :destroy
  validates :name, presence: true

  default_scope { order(id: :asc) }

  scope :search, ->(query) do
    where('lower(name) like ?', "%#{query.downcase if query}%")
  end

  def self.paginate(limit_size, page)
    page ||= 1
    limit_size = validate_limit(limit_size)

    limit(limit_size).offset((page.to_i - 1).abs * limit_size)
  end

  def self.validate_limit(limit_size)
    if limit_size
      limit_size = limit_size.to_i.abs
      return MAXIMUM_LIMIT if (limit_size > MAXIMUM_LIMIT)
      limit_size
    else
      DEFAULT_LIMIT
    end
  end
end
