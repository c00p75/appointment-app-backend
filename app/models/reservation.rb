class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :motorcycle

  validates :city, presence: true
  validates :date, presence: true
  validates :user_id, presence: true
  validates :motorcycle_id, presence: true
end
