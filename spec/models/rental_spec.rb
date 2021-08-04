require 'rails_helper'

describe Rental, type: :model do
  describe 'validations' do
    let(:rental) { build(:rental) }

    it 'is valid when all attributes are present' do
      expect(rental).to be_valid
    end

    it 'is invalid when return date is in the past' do
      rental.return_date = Date.today - 3.days

      expect(rental).not_to be_valid
    end

    it 'is invalid when the book is unavailable' do
      rental.book.update(available: false)

      expect(rental).not_to be_valid
    end

    %w[book_id user_id borrow_date return_date].each do |attribute|
      it "is not valid when #{attribute} is not present" do
        rental[attribute] = nil

        expect(rental).not_to be_valid
      end
    end
  end

  describe 'scopes' do
    describe '#borrowed' do
      let(:returned_rental) { create(:rental, returned: true) }
      let(:not_returned_rental) { create(:rental, returned: false) }

      it 'returns only rentals that are not returned yet' do
        expect(Rental.borrowed).to include(not_returned_rental)
        expect(Rental.borrowed).not_to include(returned_rental)
      end
    end
  end

  describe 'methods' do
    describe '#disable_book' do
      let(:rental) { create(:rental) }
      let(:perform) { rental.disable_book }

      it 'sets the book status to unavailable' do
        perform

        expect(Book.find(rental.book_id).available).to eq(false)
      end
    end

    describe '#enable_book' do
      let(:book) { create(:book, available: false) }
      let(:rental) { create(:rental, returned: true) }
      let(:perform) { rental.enable_book }

      it 'sets the book status to available' do
        perform

        expect(Book.find(rental.book_id).available).to eq(true)
      end
    end

    describe '#book_returned?' do
      let(:book) { create(:book, available: false) }
      let(:rental) { create(:rental, returned: true) }

      it 'sets the book status to available' do
        expect(rental.book_returned?).to eq(true)
      end
    end
  end
end