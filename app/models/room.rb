class Room < ApplicationRecord 
	validates_presence_of :name,:description,:price,:rules,:address,:image,:city_id,:user_id
	validates_length_of :description,minimum:150
	belongs_to :city
	belongs_to :user
  has_many :amenity_rooms
	has_many :amenities,through: :amenity_rooms
  has_many :bookings
	mount_uploader :image,ImageUploader
	before_validation :create_latitude_and_longitude
    def create_latitude_and_longitude
    	address_name = self.address
    	@response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{address_name}&key=AIzaSyB7mnCZz01RMNFWh2iYLa42zxkGpYJomgI")
    	data = @response["results"][0]["geometry"]["location"]
    	self.latitude = data["lat"]
    	self.longitude = data["lng"]
    end 
    after_save :change_default_value_to_host
    def change_default_value_to_host
         if self.user.role.name == "admin"

         else
          self.user.update_attributes(role_id:Role.last.id)
         end
    end
end
