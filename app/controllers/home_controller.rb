class HomeController < ApplicationController
  def index
    @rentals = Rental.borrowed
  end
end
