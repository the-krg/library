class Rental < ApplicationRecord
  scope :borrowed, -> { where(returned: false) }

  validates :book_id, :user_id, :borrow_date, :return_date, presence: true
  validate :available_book?, unless: :book_returned?
  validate :return_date_cannot_be_in_the_past, if: -> { return_date.present? }

  after_create :disable_book
  after_update :enable_book, if: :book_returned?

  belongs_to :book
  belongs_to :user

  def available_book?
    book = Book.find_by(id: book_id)

    if !book.available
      errors.add(:book_id, 'Sorry, this book was already borrowed.')
    end
  end

  def return_date_cannot_be_in_the_past
    if return_date < Date.today
      errors.add(:return_date, 'cannot be in the past.')
    end
  end

  def disable_book
    Book.find(book_id).update_column(:available, false)
  end

  def enable_book
    Book.find(book_id).update(available: true)
  end

  def book_returned?
    returned
  end
end
