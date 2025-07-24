class CreateProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :providers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :some_provider_fields

      t.timestamps
    end
  end
end
