require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { create(:user) }

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
      get :edit, params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    it 'renders ok status' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    let(:user_params) { build(:user).attributes }

    context 'with valid user params' do

      it 'renders created status' do
        post :create, params: { user: user_params }

        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid user params' do
      it 'renders created status' do
        post :create, params: { user: user_params.except('first_name') }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#update' do
    let(:user) { create(:user) }
    
    context 'with valid user params' do
      let(:new_user_params) do
        user.first_name = 'new_name'
        user.attributes
      end

      it 'renders ok status' do
        post :update, params: { id: user.id, user: new_user_params }

        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid user params' do
      let(:new_user_params) do
        user.first_name = nil
        user.attributes
      end

      it 'renders unprocessable_entity status' do
        post :update, params: { id: user.id, user: new_user_params }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe '#destroy' do
    let(:user) { create(:user) }
    
    it 'renders ok status' do
      post :destroy, params: { id: user.id }

      expect(response).to have_http_status(:ok)
    end
  end
end