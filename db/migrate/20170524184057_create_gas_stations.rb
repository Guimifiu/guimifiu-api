class CreateGasStations < ActiveRecord::Migration[5.0]
  def change
    create_table :gas_stations do |t|
      t.string :latitude
      t.string :longitude
      t.integer :google_maps_id
      t.string :vicinity
      t.string :name

      t.timestamps
    end
  end
end
