class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :nice_name
      t.integer :device_id

      t.timestamps
    end
  end
end
