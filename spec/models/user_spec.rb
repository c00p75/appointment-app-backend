require 'rails_helper'

RSpec.describe User, type: :model do
  @user_obj = { username: 'testuser', email: 'testuser@test.com', password: 'password' }
  before(:context) do
    @user = User.new(*@user_obj)
  end

  it 'should always have an email' do
    @user.email = nil
    expect(@user).to_not be_valid

    user = User.create(@user_obj)
    expect(user).to_not be_valid
  end

  it 'should always have a password' do
    @user.password = nil
    expect(@user).to_not be_valid

    user = User.create(@user_obj)
    expect(user).to_not be_valid
  end
end
