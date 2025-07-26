class AddDetailsToProviders < ActiveRecord::Migration[7.1]
  def change
    add_column :providers, :first_name, :string
    add_column :providers, :last_name, :string
    add_column :providers, :address, :string
  end
end
