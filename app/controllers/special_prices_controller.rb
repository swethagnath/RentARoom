class SpecialPricesController < ApplicationController
	def new
		@room = Room.find(params[:room_id])
		@special_price = SpecialPrice.new
	end
	def create
		@specialprice = SpecialPrice.new(special_price_parameter)
		@specialprice.save
	end
	private
	def special_price_parameter
		params[:special_price].permit(:start_date,:end_date,:room_id,:price)
	end
end
