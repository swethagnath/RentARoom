json.extract! room, :id, :name, :description, :price, :rules, :address, :image, :latitude, :longitude, :city_id, :user_id, :created_at, :updated_at
json.url room_url(room, format: :json)
