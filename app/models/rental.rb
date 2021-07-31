class Rental < ApplicationRecord
  scope :borrowed, -> { where(returned: false) }

  belongs_to :book
  belongs_to :user
end
