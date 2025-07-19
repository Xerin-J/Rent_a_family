class User < ApplicationRecord
  has_many :families
  has_many :bookings

  validates :username, presence: true
end
