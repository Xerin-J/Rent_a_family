class Provider < ApplicationRecord
  belongs_to :user
  has_one :family, dependent: :destroy  # one provider owns one family
  has_one_attached :photo
end