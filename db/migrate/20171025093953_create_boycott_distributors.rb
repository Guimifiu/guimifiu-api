class CreateBoycottDistributors < ActiveRecord::Migration[5.0]
  def change
    create_table :boycott_distributors do |t|
      t.date :start_date
      t.date :end_date
      t.references :distributor, foreign_key: true

      t.timestamps
    end
  end
end
