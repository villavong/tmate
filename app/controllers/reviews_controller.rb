class ReviewsController < ApplicationController

	def create
    @user = User.find(params[:user_id])
		@review = @user.reviews.create(review_params)
		redirect_to @review.user
	end

	def destroy
		@review = Review.find(params[:id])
		user = @review.user
		@review.destroy

		redirect_to user
	end

	private
		def review_params
			params.require(:review).permit(:comment, :star, :user_id, :author_id, :author_name)
		end
end
