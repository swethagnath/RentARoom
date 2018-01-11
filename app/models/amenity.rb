class Amenity < ApplicationRecord
	validates_presence_of :name,:description
	has_many :amenity_rooms
	has_many :rooms,through: :amenity_rooms
end
