class Book < ApplicationRecord
  has_many :rentals, dependent: :destroy
  belongs_to :book_genre

  scope :available, -> { where(available: true) }

  before_destroy :book_rented?
  before_update :book_rented?

  def book_rented?
    if Rental.find_by(book_id: id, returned: false).present?
      errors[:book] << 'Cannot delete a rented book. Please wait for it to return.'

      throw :abort
    end
  end
end
