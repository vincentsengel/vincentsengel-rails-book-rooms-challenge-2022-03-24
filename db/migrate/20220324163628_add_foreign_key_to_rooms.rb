class AddForeignKeyToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :hotel, foreign_key: true
  end
end
