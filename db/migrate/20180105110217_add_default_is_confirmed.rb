class AddDefaultIsConfirmed < ActiveRecord::Migration[5.1]
  def change
  	change_column :bookings,:is_confirmed,:boolean,default:false
  end
end
