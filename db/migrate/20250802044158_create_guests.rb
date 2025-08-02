class CreateGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      # Remove or replace this next line:
      # t.string :...other  <--- REMOVE THIS LINE
      t.string :fields  # you can keep this if you want, or rename it

      t.timestamps
    end
  end
end