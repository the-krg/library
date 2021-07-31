class Book < ApplicationRecord
  scope :available, -> { where(available: true) }
  belongs_to :book_genre
end
