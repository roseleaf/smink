class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :password, :string
    add_column :users, :remember_token, :string
    add_index  :users, :remember_token
  end
end
