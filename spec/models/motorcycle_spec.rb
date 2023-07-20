require 'rails_helper'
require 'spec_helper'

RSpec.describe Motorcycle, type: :model do
  let(:user) { User.new(email: 'test@example.com', password: 'password') }
  let(:motorcycle) do
    Motorcycle.new(
      model: 'Sample Model',
      description: 'Sample Description',
      photo: Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_photo.jpg'), 'image/jpeg'),
      duration: 5,
      finance_fee: 1000,
      purchase_fee: 2000,
      amount_payable: 5000,
      user: user
    )
  end

  subject { motorcycle }

  describe "validations" do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    context "model" do
      it 'is not valid without a model' do
        subject.model = nil
        expect(subject).not_to be_valid
      end
    end

    context "description" do
      it 'is not valid without a description' do
        subject.description = nil
        expect(subject).not_to be_valid
      end
    end

    context "photo" do
      it 'is not valid without a photo' do
        subject.photo = nil
        expect(subject).not_to be_valid
      end
    end

    context "duration" do
      it 'is not valid without a duration' do
        subject.duration = nil
        expect(subject).not_to be_valid
      end

      it 'is not valid with a non-positive duration' do
        subject.duration = 0
        expect(subject).not_to be_valid
      end
    end

    context "finance_fee" do
      it 'is not valid without a finance_fee' do
        subject.finance_fee = nil
        expect(subject).not_to be_valid
      end

      it 'is not valid with a negative finance_fee' do
        subject.finance_fee = -100
        expect(subject).not_to be_valid
      end
    end

    context "purchase_fee" do
      it 'is not valid without a purchase_fee' do
        subject.purchase_fee = nil
        expect(subject).not_to be_valid
      end

      it 'is not valid with a negative purchase_fee' do
        subject.purchase_fee = -100
        expect(subject).not_to be_valid
      end
    end

    context "amount_payable" do
      it 'is not valid without an amount_payable' do
        subject.amount_payable = nil
        expect(subject).not_to be_valid
      end

      it 'is not valid with a negative amount_payable' do
        subject.amount_payable = -100
        expect(subject).not_to be_valid
      end
    end
  end

  describe "associations" do
    it { should belong_to(:user).optional }

    it { should have_many(:reservations).dependent(:destroy) }
  end
end
