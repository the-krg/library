require 'rails_helper'

describe Book, type: :model do
  describe 'validations' do
    let(:book) { build(:book) }

    it 'is valid when all attributes are present' do
      expect(book).to be_valid
    end

    %w[name description book_genre_id].each do |attribute|
      it "is not valid when #{attribute} is not present" do
        book[attribute] = nil

        expect(book).not_to be_valid
      end
    end
  end

  describe 'scopes' do
    describe '#available' do
      let(:available_book) { create(:book) }
      let(:unavailable_book) { create(:book, available: false) }

      it 'returns only available books' do
        expect(Book.available).to include(available_book)
        expect(Book.available).not_to include(unavailable_book)
      end
    end
  end

  describe 'methods' do
    describe 'book_rented?' do
      let(:book) { create(:book) }

      context 'when there is an active rental for the book' do
        before { create(:rental, book: book) }

        it 'returns true' do
          expect(book.book_rented?).to eq(true)
        end
      end

      context 'when there is no active rental for the book' do
        before { create(:rental, book: book, returned: true) }

        it 'returns false' do
          expect(book.book_rented?).to eq(false)
        end
      end
    end
  end
end