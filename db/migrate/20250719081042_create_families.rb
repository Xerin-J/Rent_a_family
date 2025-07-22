class CreateFamilies < ActiveRecord::Migration[7.1]
  def change
    create_table :families do |t|
      t.string :members
      t.string :location
      t.string :event_type
      t.integer :hourly_rate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
