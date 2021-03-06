class BookingsController < ApplicationController 
	def index
		@booking = current_user.bookings
	end
	def create
		@booking = Booking.new(booking_params)
		@booking.user_id = current_user.id
		if @booking.save
			redirect_to room_path(@booking.room_id),notice:"successfully created"
		else
			redirect_to room_path(@booking.room_id),:flash => { :error => @booking.errors.full_messages.join(', ') }
		end
	end
	def update
		@booking = Booking.find(params[:id])
		if @booking.update_attributes(booking_params)
			redirect_to  rooms_path
		else
			redirect_to room_path(@booking.room_id),:flash => { :error => @booking.errors.full_messages.join(', ') }
		end
	end
	private
	def booking_params
		params[:booking].permit(:start_date,:end_date,:room_id,:is_confirmed)
	end
end
	