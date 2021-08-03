class Book < ApplicationRecord
  has_many :rentals, dependent: :destroy
  belongs_to :book_genre

  scope :available, -> { where(available: true) }

  validates :name, :description, :book_genre_id, presence: true

  before_destroy :abort_change, if: :book_rented?, prepend: true
  before_update :abort_change, if: :book_rented?

  def abort_change
    errors.add(:book, 'Cannot delete or update a borrowed book. Please wait for it to return.')

    throw :abort
  end

  def book_rented?
    Rental.find_by(book_id: id, returned: false).present?
  end
end
