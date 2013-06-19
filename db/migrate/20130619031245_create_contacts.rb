class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :remote_id
      t.string :name
      t.integer :device_id

      t.timestamps
    end
  end
end
