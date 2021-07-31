class CreateRentals < ActiveRecord::Migration[6.1]
  def change
    create_table :rentals do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :borrow_date
      t.date :return_date
      t.boolean :returned

      t.timestamps
    end
  end
end
