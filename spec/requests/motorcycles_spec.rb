require 'rails_helper'

RSpec.describe MotorcyclesController, type: :system do
  include Devise::Test::IntegrationHelpers

  before do
    User.delete_all
    @user = User.create!(email: 'test@example.com', password: 'password')
    @motor_params = {
      model: 'Sample Model',
      description: 'Sample Description',
      photo: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_photo.jpg'), 'image/jpeg'),
      duration: 5,
      finance_fee: 1000,
      purchase_fee: 200,
      amount_payable: 5000,
      user: @user
    }
    post '/users/tokens/sign_in', params: { email: 'test@example.com', password: 'password' }
    @token = JSON.parse(response.body)['token']
    @motor_cycle = Motorcycle.create!(@motor_params)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get '/motorcycles', headers: { Authorization: "Bearer #{@token}" }
      expect(response).to be_successful
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
        user_id: @user.id
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
        user_id: @user.id
      }
    end

    it 'creates a new motorcycle with valid params' do
      post '/motorcycles', params: { motorcycle: valid_params }, headers: { Authorization: "Bearer #{@token}" }
      expect(response).to have_http_status(:created)
    end

    it 'does not create a new motorcycle with invalid params' do
      post '/motorcycles', params: { motorcycle: invalid_params }, headers: { Authorization: "Bearer #{@token}" }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the motorcycle' do
      delete "/motorcycles/#{@motor_cycle.id}", headers: { Authorization: "Bearer #{@token}" }
      expect(response).to have_http_status(:success)
    end

    it 'returns unauthorized status when the user is not authorized to delete' do
      unauthorized_user = User.new(email: 'unauthorized@example.com', password: 'password')
      sign_in unauthorized_user

      delete '/motorcycles/1'
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
