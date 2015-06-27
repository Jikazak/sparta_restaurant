class ReviewsController < ApplicationController
  def create
    @review = Review.new(
      rate:    review_params[:rate],
      user_id: current_user.id,
      body:    review_params[:body],
      restaurant_id: params[:restaurant_id]
      )
    @review.save
    redirect_to restaurant_url(@review.restaurant)

  end

  def destroy
  end

  def update
  end

  def edit
  end

  private
  def review_params
    params.require(:review).permit(
      :body,
      :rate
      )

  end
end
