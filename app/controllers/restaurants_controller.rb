class RestaurantsController < ApplicationController
  def index         # GET /restaurants
    @restaurants = Restaurant.all
  end

  def show          # GET /restaurants/:id
    @restaurant = Restaurant.find(params[:id])
  end

  def new           # GET /restaurants/new
    @restaurant = Restaurant.new
  end

  def create        # POST /restaurants
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def edit          # GET /restaurants/:id/edit
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
