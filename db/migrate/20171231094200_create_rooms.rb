class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.float :price
      t.text :rules
      t.string :address
      t.string :image
      t.float :latitude
      t.float :longitude
      t.integer :city_id
      t.integer :user_id
      t.timestamps
    end
  end
end
