FactoryBot.define do
  factory :motorcycle do
    model { 'Test Model' }
    description { 'Test Description' }
    photo { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_photo.jpg'), 'image/jpeg') }
    duration { 5 }
    finance_fee { 1000 }
    purchase_fee { 2000 }
    amount_payable { 5000 }
    user # You may need to define the 'user' association if necessary
  end
end
