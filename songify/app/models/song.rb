class Song < ApplicationRecord
  validates :title, { presence: true }
  validates :artist, { presence: true }
  validates :search_count { presence: true }
end
