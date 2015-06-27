class ReviewsController < ApplicationController
  def create
    @review = Review.new(
      rate:    params[:rate]
      user_id: current_user.id,
      body:    review_params[:body],
      restaurant_id: review_params[:restaurant_id]

      )
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
