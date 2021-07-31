# Create some base Genres
(30).times { BookGenre.create(name: Faker::Book.genre) }

# Create Users and Books

(20).times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    book_genre_id: BookGenre.pluck(:id).sample
  )

  Book.create(
    name: Faker::Book.title,
    description: Faker::Quote.matz,
    book_genre_id: BookGenre.pluck(:id).sample
  )
end

(10).times do
  Rental.create(
    user_id: User.pluck(:id).sample,
    book_id: Book.pluck(:id).sample,
    borrow_date: Date.today - rand(10),
    return_date: Date.today + rand(10),
    returned: false
  )
end