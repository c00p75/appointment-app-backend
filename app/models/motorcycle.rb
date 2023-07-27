class Motorcycle < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reservations, dependent: :destroy

  validates :model, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :finance_fee, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :purchase_fee, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :amount_payable, presence: true, numericality: { greater_than_or_equal_to: 0 }

  mount_uploader :photo, PhotoUploader # mounting uploader to appropriate attribute
end
