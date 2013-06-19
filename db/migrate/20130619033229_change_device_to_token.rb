class ChangeDeviceToToken < ActiveRecord::Migration
  def change
    add_column :devices, :token, :string
    add_index :devices, :token, :unique => true
  end
end
