class AddLastNameToGuests < ActiveRecord::Migration[7.1]
  def change
    add_column :guests, :last_name, :string
  end
end
