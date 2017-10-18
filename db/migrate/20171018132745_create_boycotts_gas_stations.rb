class CreateBoycottsGasStations < ActiveRecord::Migration[5.0]
  def change
    create_table :boycotts_gas_stations do |t|
      t.references :gas_station, foreign_key: true
      t.references :boycott, foreign_key: true
    end
  end
end
