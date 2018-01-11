class AmenityRoom < ApplicationRecord
	belongs_to :room
	belongs_to :amenity
end
