require 'rails_helper'

RSpec.describe ReservationsController, type: :system do
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

  it 'Should be able to view current reservations' do
    get '/reservations', headers: { 'Authorization': "Bearer #{@token}"}
    expect(response.body).to eq("[]")
  end

  it 'Should be able to create a reservation' do
    post '/reservations', params: {
      reservation: {
        city: 'Kampala',
        date: '02-02-2023',
        motorcycle_id: @motor_cycle.id
      }
    }, headers: { 'Authorization': "Bearer #{@token}"}
    expect(response).to have_http_status(:success)
  end

  it 'Should be able to not create a reservation with invalid params' do
    post '/reservations', params: {
      reservation: {
        city: 'Kampala',
        date: '02-02-2023',
        motorcycle_id: nil
      }
    }, headers: { 'Authorization': "Bearer #{@token}"}
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'deletes a reservation' do
    reservation = Reservation.create!(
      city: 'Kampala',
      date: '02-02-2023',
      user_id: @user.id,
      motorcycle_id: @motor_cycle.id
    )
    delete "/reservations/#{reservation.id}", headers: { 'Authorization': "Bearer #{@token}"}
    expect(response).to have_http_status(:success)
  end
end
