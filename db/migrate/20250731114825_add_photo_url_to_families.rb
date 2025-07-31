class AddPhotoUrlToFamilies < ActiveRecord::Migration[7.1]
  def change
    add_column :families, :photo_url, :string
  end
end
