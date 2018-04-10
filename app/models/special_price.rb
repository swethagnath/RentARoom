class SpecialPrice < ApplicationRecord
	validates_presence_of :start_date,:end_date,:price,:room_id
	belongs_to :room
end
