class CreateBoycotts < ActiveRecord::Migration[5.0]
  def change
    create_table :boycotts do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
