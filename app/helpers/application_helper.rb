module ApplicationHelper
  def genre_name(genre_id)
    genre = BookGenre.find_by(id: genre_id)

    genre.present? ? genre.name : 'No favorite genre'
  end
end
