class User < ApplicationRecord
  belongs_to :book_genre
  has_many :books, through: :rentals
  has_many :rentals, dependent: :destroy
end
