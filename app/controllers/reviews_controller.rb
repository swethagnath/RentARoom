class ReviewsController < ApplicationController
	def index
	end
	def new		
	end
	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.save
		redirect_to room_path(@review.room_id)
	end
	private
	def review_params
		params[:review].permit(:review,:food_rating,:cleanliness_rating,:safety_rating,:facility_rating,:locality_rating,:room_id,:user_id)
	end
end
