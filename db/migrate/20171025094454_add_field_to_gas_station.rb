class AddFieldToGasStation < ActiveRecord::Migration[5.0]
  def change
    add_reference :gas_stations, :distributor, foreign_key: true
  end
end
