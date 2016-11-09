class Bucketlist < ApplicationRecord
  MAXIMUM_LIMIT = 100
  DEFAULT_LIMIT = 20

  belongs_to :user
  has_many :items, dependent: :destroy
  validates :name, presence: true

  scope :search, ->(query) do
    where('lower(name) like ?', "%#{query.downcase if query}%")
  end

<<<<<<< HEAD
  scope :paginate, ->(result_size, page) do
    limit(result_size.abs).offset((page.to_i - 1).abs * result_size)
  end

  def self.search_and_paginate(query = {})
    result_size = get_result_size(query)
=======
  def self.paginate(limit_size, page)
<<<<<<< HEAD
<<<<<<< HEAD
    page ||= 1 
    
    if limit_size
      limit_size = (MAXIMUM_LIMIT if limit_size.to_i.abs > MAXIMUM_LIMIT) \
                    || limit_size.to_i.abs
    else
      limit_size = DEFAULT_LIMIT
    end
>>>>>>> fix indentation

=======
    page ||= 1   
=======
    page ||= 1
>>>>>>> fix errors in documentation
    limit_size = validate_limit(limit_size)
>>>>>>> remove duplication
    limit(limit_size).offset((page.to_i - 1).abs * limit_size)
  end

  def self.validate_limit(limit_size)
    if limit_size
      (MAXIMUM_LIMIT if limit_size.to_i.abs > MAXIMUM_LIMIT) || \
        limit_size.to_i.abs
    else
      DEFAULT_LIMIT
    end
  end
end
