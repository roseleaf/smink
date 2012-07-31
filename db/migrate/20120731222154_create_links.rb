class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :in_url
      t.string :out_url

      t.timestamps
    end
  end
end
