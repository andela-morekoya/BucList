class Bucketlist < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :items
  validates :name, presence: true

  scope :search, ->(query) do
    where('lower(name) like ?', "%#{query.downcase}%")
  end

  scope :paginate, ->(list_limit, page) do
    limit(list_limit).offset("#{(page - 1) * list_limit}".to_i)
  end

  def self.search_and_paginate(query = {})
    list_limit = get_list_limit(query)
    page = query[:page] || 1

    if query[:q]
      search(query[:q]).paginate(list_limit, page)
    else
      all.paginate(list_limit, page)
    end
  end

  def get_list_limit(query)
    max_limit = 100
    (20 unless query[:limit]) || (max_limit if query[:limit] > max_limit) \
      || query[:limit]
  end
end
