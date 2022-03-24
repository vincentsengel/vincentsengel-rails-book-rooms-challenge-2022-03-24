class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :price_per_night, null: false
      t.integer :capacity, null: false

      t.timestamps
    end
  end
end
