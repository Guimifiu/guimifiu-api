class CreatePriceSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :price_suggestions do |t|
      t.string :type
      t.string :user_id
      t.string :gas_station_id
      t.string :value

      t.timestamps
    end
  end
end
