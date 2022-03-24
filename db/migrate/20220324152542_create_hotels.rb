class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
