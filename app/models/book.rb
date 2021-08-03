class Book < ApplicationRecord
  has_many :rentals, dependent: :destroy
  belongs_to :book_genre

  scope :available, -> { where(available: true) }

  validates :name, :description, :book_genre_id, presence: true

  before_destroy :book_rented?, prepend: true
  before_update :book_rented?

  def book_rented?
    if Rental.find_by(book_id: id, returned: false).present?
      errors.add(:book, 'Cannot delete or update a borrowed book. Please wait for it to return.')

      throw :abort
    end
  end
end
