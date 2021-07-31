json.extract! rental, :id, :book_id, :user_id, :borrow_date, :return_date, :returned, :created_at, :updated_at
json.url rental_url(rental, format: :json)
