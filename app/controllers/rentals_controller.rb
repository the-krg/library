class RentalsController < ApplicationController
  before_action :set_rental, only: %i[ show edit update destroy ]

  def index
    @rentals = Rental.all
  end

  def show
  end

  def new
    @rental = Rental.new
    @users = User.all
    @books = Book.available
  end

  def edit
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.borrow_date = Date.today
    @rental.returned = false

    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: "Rental was successfully created." }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: "Rental was successfully updated." }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: "Rental was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_rental
      @rental = Rental.find(params[:id])
    end

    def rental_params
      params.require(:rental).permit(:book_id, :user_id, :borrow_date, :return_date, :returned)
    end
end
