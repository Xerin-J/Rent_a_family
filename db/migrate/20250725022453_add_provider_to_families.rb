class AddProviderToFamilies < ActiveRecord::Migration[7.1]
  def change
    add_reference :families, :provider, foreign_key: true
  end
end