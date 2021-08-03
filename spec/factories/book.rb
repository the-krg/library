FactoryBot.define do
  factory :book do
    name { Faker::Book.title }
    description { Faker::Quote.matz }
    book_genre { create(:book_genre) }
    available { true }
  end
end