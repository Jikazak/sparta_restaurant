class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :update, :destroy, :edit ]
  def new
    @restaurant = Restaurant.new
  end

  def show
  end

  def create
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

end
