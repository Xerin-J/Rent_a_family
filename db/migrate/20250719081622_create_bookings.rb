class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :start_time
      t.date :end_time
      t.string :location
      t.string :event_type
      t.integer :total_cost
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true

      t.timestamps
    end
  end
end
