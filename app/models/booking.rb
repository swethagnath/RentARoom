class Booking < ApplicationRecord
	validates_presence_of :start_date,:end_date,:room_id,:user_id,:price
	validate :booking_checked,on: :create
	belongs_to :user
	belongs_to :room
	before_validation :attribues_adding
	#after_create :sent_email_to_guest
	def attribues_adding
		self.price = (self.start_date..self.end_date).count * self.room.price		
	end
	def booking_checked		
			if (self.end_date < Date.today) || (self.start_date < Date.today)
				errors.add(:the, "date expired")
			else
			 	Booking.where(["room_id = ? and start_date >= ?",self.room_id,Date.today]).each do |booking|
					 booked_date = (booking.start_date..booking.end_date).to_a
					 current_date = (self.start_date..self.end_date).to_a
					 if booked_date != (booked_date - current_date)
					 	errors.add(:the, "room is already booked")
					 end
			 	end
			end
	end
end
