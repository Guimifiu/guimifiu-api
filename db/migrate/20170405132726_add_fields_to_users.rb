class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :document_number, :string
    add_column :users, :phone, :string
    add_column :users, :uid, :string
    add_column :users, :oauth_token, :string
    add_column :users, :provider, :string
  end
end
