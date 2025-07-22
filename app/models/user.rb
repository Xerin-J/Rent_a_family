class User < ApplicationRecord
  has_secure_password

  has_many :families
  has_many :bookings

  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, if: -> { new_record? || !password.nil? }

  def self.authenticate_credentials(username, password)
    user = find_by(username: username)
    user&.authenticate(password)
  end
end
