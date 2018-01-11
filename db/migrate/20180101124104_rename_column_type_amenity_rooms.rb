class RenameColumnTypeAmenityRooms < ActiveRecord::Migration[5.1]
  def change
  	rename_column :amenity_rooms,:aminity_id,:amenity_id
  end
end
