class CreatePriceSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :price_suggestions do |t|
      t.integer :fuel_type
      t.references :user, foreign_key: true
      t.references :gas_station, foreign_key: true
      t.decimal :value

      t.timestamps
    end
  end
end
