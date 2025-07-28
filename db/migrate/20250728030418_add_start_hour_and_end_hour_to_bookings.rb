class AddStartHourAndEndHourToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :start_hour, :time
    add_column :bookings, :end_hour, :time
  end
end
