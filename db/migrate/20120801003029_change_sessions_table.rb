class ChangeSessionsTable < ActiveRecord::Migration
  def change
    add_column :sessions, :name, :string
    add_column :sessions, :password, :string
  end
end
