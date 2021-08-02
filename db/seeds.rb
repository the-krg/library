# Create some base Genres
puts "Creating genres..."
(30).times { BookGenre.create(name: Faker::Book.genre) }

puts "#{BookGenre.count} genres created!"
# Create Users and Books

puts "Creating users and books..."
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

puts "#{Book.count} books created!"
puts "#{User.count} users created!"

puts "Creating fake rentals..."

Book.first(12).each do |book|
  puts "Creating rental for book #{book.id}"
  Rental.create(
    user_id: User.pluck(:id).sample,
    book_id: book.id,
    borrow_date: Date.today - rand(10),
    return_date: Date.today + rand(10),
    returned: false
  )
end

puts "#{Rental.count} rentals created!"
