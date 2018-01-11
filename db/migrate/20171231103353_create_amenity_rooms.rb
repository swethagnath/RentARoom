class CreateAmenityRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :amenity_rooms do |t|
      t.integer :room_id
      t.string :aminity_id

      t.timestamps
    end
  end
end
