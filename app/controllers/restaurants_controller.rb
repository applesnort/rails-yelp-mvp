class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
  end

  def show
    set_restaurant
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
