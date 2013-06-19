class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.integer :contact_id
      t.text :number

      t.timestamps
    end
  end
end
