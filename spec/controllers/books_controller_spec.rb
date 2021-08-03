require 'rails_helper'

describe BooksController, type: :controller do
  let(:book) { create(:book) }

  describe '#index' do
    it 'renders ok status' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#new' do
    it 'renders ok status' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#edit' do
    it 'renders ok status' do
      get :edit, params: { id: book.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    it 'renders ok status' do
      get :show, params: { id: book.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    let(:book_params) { build(:book).attributes }

    context 'with valid book params' do

      it 'renders created status' do
        post :create, params: { book: book_params }

        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid book params' do
      it 'renders created status' do
        post :create, params: { book: book_params.except('name') }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#update' do
    let(:book) { create(:book) }
    
    context 'with valid book params' do
      let(:new_book_params) do
        book.name = 'new_name'
        book.attributes
      end

      it 'renders ok status' do
        post :update, params: { id: book.id, book: new_book_params }

        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid book params' do
      let(:new_book_params) do
        book.name = nil
        book.attributes
      end

      it 'renders unprocessable_entity status' do
        post :update, params: { id: book.id, book: new_book_params }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#destroy' do
    let(:book) { create(:book) }

    context 'when book not rented' do
      it 'renders ok status' do
        post :destroy, params: { id: book.id }

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when book is rented' do
      before { rental = create(:rental, book: book) }

      it 'renders unprocessable_entity status' do
        post :destroy, params: { id: book.id }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end