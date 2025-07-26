class Family < ApplicationRecord
  has_many :bookings
  belongs_to :provider, class_name: "Provider"

  validates :members, presence: true, length: { minimum: 1, maximum: 100 }
  validates :location, presence: true
  validates :hourly_rate, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :event_type, presence: true
end