class CreateDistributors < ActiveRecord::Migration[5.0]
  def change
    create_table :distributors do |t|
      t.string :name
      t.string :image_path

      t.timestamps
    end
  end
end
