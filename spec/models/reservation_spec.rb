require 'rails_helper'

RSpec.describe Reservation, type: :model do
  @user_obj = { username: 'testuser', email: 'testuser@test.com', password: 'password' }
  @reservation_obj = { city: 'London', date: '11-11-2023' }
  before(:context) do
    @user = User.create(*@user_obj)
    motorcycle = Motorcycle.create(
      model: 'Sample Model',
      description: 'Sample Description',
      photo: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_photo.jpg'), 'image/jpeg'),
      duration: 5,
      finance_fee: 1000,
      purchase_fee: 2000,
      amount_payable: 5000,
      user: @user
    )
    @reservation = Reservation.new(*@reservation_obj, user_id: @user.id, motorcycle_id: motorcycle.id)
  end

  it 'should always have an city' do
    @reservation.city = nil
    expect(@reservation).to_not be_valid

    @reservation.save
    expect(@reservation).to_not be_valid
  end

  it 'should always have a date' do
    @reservation.date = nil
    expect(@reservation).to_not be_valid

    @reservation.save
    expect(@reservation).to_not be_valid
  end

  it 'should always have a user id' do
    @reservation.user_id = nil
    expect(@reservation).to_not be_valid

    @reservation.save
    expect(@reservation).to_not be_valid
  end

  it 'should always have a motorcycle id' do
    @reservation.motorcycle_id = nil
    expect(@reservation).to_not be_valid

    @reservation.save
    expect(@reservation).to_not be_valid
  end
end
