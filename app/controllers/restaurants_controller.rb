class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    # raise
    if @restaurant.valid?
      @restaurant.save!
      redirect_to restaurants_path
    else
     render :new
    end
  end
  
  def update
    set_restaurant
    @restaurant.update(restaurant_params)
    
    redirect_to restaurant_path(@restaurant)
  end

  def show
    set_restaurant
    @reviews = @restaurant.reviews
  end

  def destroy
    set_restaurant
    @restaurant.destroy

    redirect_to restaurants_path
  end
  

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
