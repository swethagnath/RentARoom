class AddColumnToRooms < ActiveRecord::Migration[5.1]
  def change
  	add_column :rooms,:is_authorized,:boolean,default:false
  end
end
