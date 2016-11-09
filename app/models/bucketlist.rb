class Bucketlist < ApplicationRecord
  MAXIMUM_LIMIT = 100
  DEFAULT_LIMIT = 20
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :name, presence: true

  scope :search, ->(query) do
    where('lower(name) like ?', "%#{query.downcase}%")
  end

  def self.paginate(limit_size, page)
    page ||= 1 
    
    if limit_size
      limit_size = (MAXIMUM_LIMIT if limit_size.to_i.abs > MAXIMUM_LIMIT) \
                    || limit_size.to_i.abs
    else
      limit_size = DEFAULT_LIMIT
    end

    limit(limit_size).offset((page.to_i - 1).abs * limit_size)
  end

  def self.validate_limit(limit_size)
    max_limit = 100
    default_limit = 20
  end
end
