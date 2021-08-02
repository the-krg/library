class HomeController < ApplicationController
  def index
    render locals: { rentals: Rental.borrowed.order(borrow_date: :asc) }
  end
end
