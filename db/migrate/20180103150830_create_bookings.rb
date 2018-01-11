class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :user_id
      t.integer :room_id
      t.boolean :is_confirmed
      t.float :price
      t.timestamps
    end
  end
end
