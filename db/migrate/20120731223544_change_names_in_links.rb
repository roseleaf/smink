class ChangeNamesInLinks < ActiveRecord::Migration
  def change
    rename_column :links, :in_url, :long_url
    rename_column :links, :out_url, :short_url
  end
end
