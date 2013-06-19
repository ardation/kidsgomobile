class AddDeviceKeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :device_key, :integer
  end
end
