class Booking < ApplicationRecord 
	validates_presence_of :start_date,:end_date,:room_id,:user_id,:price
	validate :booking_checked,on: :create
	belongs_to :user
	belongs_to :room
	before_validation :attribues_adding
	#after_create :sent_email_to_guest
	after_update :booking_confirmed_by_the_host
	after_create :sending_mail_to_host_and_guest
	def checking_for_special_price(start_date,end_date)
		booking_date = (start_date..end_date).to_a
		total = 0
	    SpecialPrice.where(["room_id = ? and start_date >= ?",self.room_id,Date.today]).each do |specialprice|
			  special_price_date = (specialprice.start_date..specialprice.end_date).to_a
			  date_diffrence = (booking_date - special_price_date)
			  if booking_date != date_diffrence
			  		total += (booking_date.length - date_diffrence.length) * (specialprice.price)
			  end
			 booking_date = date_diffrence
		end	
		return booking_date,total                                                                                                          
	end
	def attribues_adding
		start_date = self.start_date
		end_date =self.end_date
		array = checking_for_special_price(start_date,end_date)
		if array[0] != array[0].empty?
			array[1] += array[0].count * self.room.price
			self.price = array[1]
			array[1] = 0
	  	end	
	end
	def booking_confirmed_by_the_host
		if self.is_confirmed
			NotificationMailer.confirmed_by_host(self).deliver!
		end
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
	def sending_mail_to_host_and_guest
		NotificationMailer.bookinged_by_user(self).deliver!
		NotificationMailer.confirmation_of_user_booking_by_host(self).deliver!
	end
	private

end
