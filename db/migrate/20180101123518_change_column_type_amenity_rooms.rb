class ChangeColumnTypeAmenityRooms < ActiveRecord::Migration[5.1]
  def change
  	change_column :amenity_rooms,:aminity_id,:integer
  end
end
