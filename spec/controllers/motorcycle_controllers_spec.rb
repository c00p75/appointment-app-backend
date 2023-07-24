require 'rails_helper'

RSpec.describe MotorcyclesController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { User.new(email: 'test@example.com', password: 'password') }
  let(:motorcycle) do
    Motorcycle.new(model: 'Sample Model', description: 'Sample Description',
                   photo: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_photo.jpg'),
                                                       'image/jpeg'), duration: 5, finance_fee: 1000, purchase_fee: 200,
                   amount_payable: 5000, user:)
  end

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns all motorcycles to @motorcycles' do
      motorcycle1 = instance_double(Motorcycle)
      motorcycle2 = instance_double(Motorcycle)
      allow(Motorcycle).to receive(:all).and_return([motorcycle1, motorcycle2])
      get :index
      expect(assigns(:motorcycles)).to match_array([motorcycle1, motorcycle2])
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      allow(Motorcycle).to receive(:find).and_return(motorcycle)
      get :show, params: { id: 1 }
      expect(response).to be_successful
    end

    it 'assigns the requested motorcycle to @motorcycle' do
      allow(Motorcycle).to receive(:find).and_return(motorcycle)
      get :show, params: { id: 1 }
      expect(assigns(:motorcycle)).to eq(motorcycle)
    end
  end

  describe 'POST #create' do
    let(:valid_params) do
      {
        model: 'Sample Model',
        description: 'Sample Description',
        photo: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_photo.jpg'), 'image/jpeg'),
        duration: 5,
        finance_fee: 1000,
        purchase_fee: 2000,
        amount_payable: 5000,
        user_id: user.id
      }
    end

    let(:invalid_params) do
      {
        model: nil,
        description: nil,
        photo: nil,
        duration: nil,
        finance_fee: -100, # Invalid value
        purchase_fee: 2000,
        amount_payable: 5000,
        user_id: user.id
      }
    end

    it 'creates a new motorcycle with valid params' do
      expect(Motorcycle).to receive(:new).with(valid_params).and_return(motorcycle)
      expect(motorcycle).to receive(:save).and_return(true)
      post :create, params: { motorcycle: valid_params }
      expect(response).to have_http_status(:created)
    end

    it 'does not create a new motorcycle with invalid params' do
      expect(Motorcycle).to receive(:new).with(invalid_params).and_return(motorcycle)
      expect(motorcycle).to receive(:save).and_return(false)
      post :create, params: { motorcycle: invalid_params }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the motorcycle' do
      allow(Motorcycle).to receive(:find).and_return(motorcycle)
      expect(motorcycle).to receive(:destroy).and_return(true)
      delete :destroy, params: { id: 1 }
      expect(response).to have_http_status(:success)
    end

    it 'returns unauthorized status when the user is not authorized to delete' do
      sign_out user
      unauthorized_user = User.new(email: 'unauthorized@example.com', password: 'password')
      sign_in unauthorized_user

      delete :destroy, params: { id: 1 }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
