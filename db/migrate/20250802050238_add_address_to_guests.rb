class AddAddressToGuests < ActiveRecord::Migration[7.1]
  def change
    add_column :guests, :address, :string
  end
end
