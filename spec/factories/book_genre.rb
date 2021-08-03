FactoryBot.define do
  factory :book_genre do
    name { Faker::Book.genre }
  end
end