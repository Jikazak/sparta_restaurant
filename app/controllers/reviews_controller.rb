class ReviewsController < ApplicationController
  def create
    @review = Review.new(
      rate:    review_params[:rate],
      user_id: current_user.id,
      body:    review_params[:body],
      title:   review_params[:title],
      restaurant_id: params[:restaurant_id]
      )
    if @review.save
      redirect_to restaurant_url(@review.restaurant)
    else
      redirect_to new_restaurant_review_path(@review.restaurant)
    end
  end

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find_by(restaurant_id: @restaurant.id, user_id: current_user.id)
    @review.destroy
    redirect_to restaurant_url(@review.restaurant)
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find_by(restaurant_id: @restaurant.id, user_id: current_user.id)
    if @review.update(review_params)
     redirect_to restaurant_url(@review.restaurant)
    else
     redirect_to new_restaurant_review_path(@review.restaurant)
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find_by(restaurant_id: @restaurant.id, user_id: current_user.id)
  end

  private
  def review_params
    params.require(:review).permit(
      :rate,
      :title,
      :body
      )

  end
end
