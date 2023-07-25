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
      Motorcycle.delete_all
      motorcycle1 = Motorcycle.create(model: 'Sample Model', description: 'Sample Description',
                                  photo: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_photo.jpg'),
                                                                  'image/jpeg'), duration: 5, finance_fee: 1000, purchase_fee: 200,
                                  amount_payable: 5000, user:)

      motorcycle2 = Motorcycle.create(model: 'Sample Model', description: 'Sample Description',
                                  photo: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_photo.jpg'),
                                                                  'image/jpeg'), duration: 5, finance_fee: 1000, purchase_fee: 200,
                                  amount_payable: 5000, user:)

      motorcycles = [motorcycle1, motorcycle2]
      @motorcycles = motorcycles.select { |motorcycle| motorcycle.id % 2 == 0 }
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

  describe 'DELETE #destroy' do

    it 'returns unauthorized status when the user is not authorized to delete' do
      sign_out user
      unauthorized_user = User.new(email: 'unauthorized@example.com', password: 'password')
      sign_in unauthorized_user

      delete :destroy, params: { id: 1 }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
