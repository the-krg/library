class User < ApplicationRecord
  belongs_to :book_genre
  has_many :books, through: :rentals
  has_many :rentals, dependent: :destroy

  validates :first_name, :last_name, :book_genre_id, presence: true
end
