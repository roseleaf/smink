class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :link_id
      t.string  :country
      t.timestamps
    end
  end
end
