class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :app_id
      t.timestamp :start_time
      t.timestamp :end_time

      t.timestamps
    end
  end
end
