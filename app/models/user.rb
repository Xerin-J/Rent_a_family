class User < ApplicationRecord
  has_many :families
  has_many :bookings

  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, if: -> { new_record? || !password.nil? }
end
