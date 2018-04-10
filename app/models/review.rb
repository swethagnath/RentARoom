class Review < ApplicationRecord
	validates_presence_of :review,:food_rating,:cleanliness_rating,:safety_rating,:facility_rating,:locality_rating,:room_id,:user_id	
	validates_length_of :review,minimum:150
	belongs_to :user
	belongs_to :room
end
