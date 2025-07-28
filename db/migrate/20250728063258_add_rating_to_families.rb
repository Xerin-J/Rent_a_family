class AddRatingToFamilies < ActiveRecord::Migration[7.1]
  def change
    add_column :families, :rating, :float
  end
end
