class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :family

  validates :start_time, presence: true
  validates :end_time, presence: true
  # validates :location, presence: true
  # validates :event_type, presence: true
  validates :total_cost, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # validate :start_time_cannot_be_in_the_past
  # validate :end_after_start

  private

  def start_time_cannot_be_past
    return if start_time.blank?

    errors.add(:start_time, "The start time cannot be in the past.") if start_time < Date.today
  end

  def end_time_after_start
    return if end_time.blank? || start_time.blank?

    errors.add(:end_time, "End time must be after the start time.") if end_time <= start_time
  end
end
