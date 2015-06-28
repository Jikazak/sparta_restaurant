class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :update, :destroy, :edit ]
  def new
    @restaurant = Restaurant.new
  end

  def show
    if user_signed_in?
      @current_user_review = Review.find_by(user_id: current_user.id, restaurant_id: @restaurant.id)
    end
    # binding.pry
    @average = @restaurant.reviews.average(:rate)
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurant_url(@restaurant)
  end

  def index
    @restaurants = Restaurant.all
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(
      :restaurant_name,
      :phone,
      :address,
      :url
      )
  end
end
