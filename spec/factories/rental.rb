FactoryBot.define do
  factory :rental do
    user { create(:user) }
    book { create(:book) }
    borrow_date { Date.today }
    return_date { Date.today + 3.days }
    returned { false }

    trait(:late) do
      to_create { |instance| instance.save(validate: false) }

      borrow_date { Date.today - 3.days }
      return_date { Date.today - 1.day }
    end
  end
end