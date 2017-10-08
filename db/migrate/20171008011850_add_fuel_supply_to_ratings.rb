class AddFuelSupplyToRatings < ActiveRecord::Migration[5.0]
  def change
    add_reference :ratings, :fuel_supply, foreign_key: true
  end
end
