class Bucketlist < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :name, presence: true

  scope :search, ->(query) do
    where('lower(name) like ?', "%#{query.downcase}%")
  end

  scope :paginate, ->(result_size, page) do
    limit(result_size.abs).offset((page.to_i - 1).abs * result_size)
  end

  def self.search_and_paginate(query = {})
    result_size = get_result_size(query)

    page = query[:page] || 1

    (search(query[:q]).paginate(result_size, page) if query[:q]) \
      || all.paginate(result_size, page)
  end

  def self.get_result_size(query)
    max_result_size = 100
    default_result_size = 20

    (default_result_size unless query[:limit]) \
      || (max_result_size if query[:limit] > max_result_size) \
      || query[:limit]
  end
end
