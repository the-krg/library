class HomeController < ApplicationController
  def index
    render locals: { 
      rentals: Rental.includes(:user, :book).borrowed.order(borrow_date: :asc) 
    }
  end
end
