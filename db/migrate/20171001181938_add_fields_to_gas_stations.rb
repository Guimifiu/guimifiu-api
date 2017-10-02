class AddFieldsToGasStations < ActiveRecord::Migration[5.0]
  def change
  	add_column :gas_stations, :gasoline_price, :float
    add_column :gas_stations, :alcohol_price, :float
    add_column :gas_stations, :diesel_price, :float
  end
end
