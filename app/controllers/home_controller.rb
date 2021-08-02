class HomeController < ApplicationController
  def index
    render locals: { rentals: Rental.borrowed }
  end
end
