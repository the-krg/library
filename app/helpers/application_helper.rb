module ApplicationHelper
  def genre_name(genre_id)
    @genres ||= BookGenre.all
    genre = @genres.find { |genre| genre.id == genre_id }

    genre.present? ? genre.name : 'No favorite genre'
  end

  def book_genres
    BookGenre.all
  end
end
