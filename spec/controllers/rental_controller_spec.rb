require 'rails_helper'

describe RentalsController, type: :controller do
  let(:rental) { create(:rental) }

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

  describe '#show' do
    it 'renders ok status' do
      get :show, params: { id: rental.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    let(:rental_params) { build(:rental).attributes }

    context 'with valid rental params' do
      it 'redirects to rental' do
        post :create, params: { rental: rental_params }

        expect(response).to redirect_to(rental_path(assigns(:rental).id))
      end
    end

    context 'with missing params' do
      before { post :create, params: { rental: rental_params.except('return_date') } }

      it 'renders unprocessable_entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders new rental page' do
        expect(response).to render_template(:new)
      end
    end

    context 'with return date in the past' do
      before do
        rental_params['return_date'] = Date.today - 3.days
        post :create, params: { rental: rental_params }
      end

      it 'renders unprocessable_entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders new rental page' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#return' do
    context 'when successfuly returned' do
      let(:rental) { create(:rental) }
      let(:book) { rental.book }
      let(:perform) { post :return, params: { format: 'json', id: rental.id } } 
      subject { response }

      it { is_expected.to have_http_status(:ok) }
      it 'updates book status to available' do
        expect { perform }.to change {
          Book.find(book.id).available
        }.from(false).to(true)
      end

      it 'updates rental status to returned' do
        expect { perform }.to change {
          Rental.find(rental.id).returned
        }.from(false).to(true)
      end
    end
  end
end