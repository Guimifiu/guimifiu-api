class CreateFuelSupplies < ActiveRecord::Migration[5.0]
  def change
    create_table :fuel_supplies do |t|
      t.references :user, foreign_key: true
      t.references :gas_station, foreign_key: true
      t.boolean :fuelled
      t.boolean :boycotted
      t.decimal :value

      t.timestamps
    end
  end
end
