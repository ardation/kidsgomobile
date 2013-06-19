class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :number_id
      t.timestamp :date
      t.text :body
      t.integer :type

      t.timestamps
    end
  end
end
