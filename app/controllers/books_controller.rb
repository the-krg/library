class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  def index
    books = Book.all.load

    available = books.select { |b| b.available == true }
    unavailable = books.select { |b| b.available == false }
  
    render locals: { 
      available_books: available,
      unavailable_books: unavailable,
    }
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @book.destroy
        format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
        format.json { head :no_content }
      else
        format.html { redirect_to @book, notice: @book.errors.full_messages }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :description, :available, :book_genre_id)
    end
end
