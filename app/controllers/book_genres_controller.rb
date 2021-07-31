class BookGenresController < ApplicationController
  before_action :set_book_genre, only: %i[ show edit update destroy ]

  def index
    @book_genres = BookGenre.all
  end

  def show
  end

  def new
    @book_genre = BookGenre.new
  end

  def edit
  end

  def create
    @book_genre = BookGenre.new(book_genre_params)

    respond_to do |format|
      if @book_genre.save
        format.html { redirect_to @book_genre, notice: "Book genre was successfully created." }
        format.json { render :show, status: :created, location: @book_genre }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book_genre.update(book_genre_params)
        format.html { redirect_to @book_genre, notice: "Book genre was successfully updated." }
        format.json { render :show, status: :ok, location: @book_genre }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book_genre.destroy
    respond_to do |format|
      format.html { redirect_to book_genres_url, notice: "Book genre was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_book_genre
      @book_genre = BookGenre.find(params[:id])
    end

    def book_genre_params
      params.require(:book_genre).permit(:name)
    end
end
