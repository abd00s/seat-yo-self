class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def welcome
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.owner_id = current_user.id 
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end  
  end

  def edit
  end

  def update
    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end     
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to root_path    
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])  
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description, :open_hour, :close_hour, :capacity)
  end     
end
