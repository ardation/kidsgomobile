class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.integer :number_id
      t.timestamp :date
      t.integer :type
      t.integer :duration

      t.timestamps
    end
  end
end
