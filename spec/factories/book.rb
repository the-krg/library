FactoryBot.define do
  factory :book do
    name { Faker::Book.name }
    description { Faker::Quote.matz }
    book_genre { create(:book_genre) }
  end
end