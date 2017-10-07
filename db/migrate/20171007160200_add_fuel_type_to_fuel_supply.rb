class AddFuelTypeToFuelSupply < ActiveRecord::Migration[5.0]
  def change
    add_column :fuel_supplies, :fuel_type, :integer
  end
end
