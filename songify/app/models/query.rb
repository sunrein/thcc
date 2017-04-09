class Query < ApplicationRecord
  validates :title, { presence: true }
  validates :search_count { presence: true }
end
