class Family < ApplicationRecord
  # belongs_to :user
  # has_many :bookings

  validates :members, presence: true, length: { minimum: 1, maximum: 100 }
  validates :location, presence: true
  validates :hourly_rate, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :event_type, presence: true
end
