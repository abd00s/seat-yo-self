class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_filter :ensure_logged_in, only: [:create, :update, :destroy]

  def index
    @restaurant = Restaurant.all
    @reservations = Reservation.all
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])    
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new(reservation_params)
    @reservation.customer_id = current_user.id
    if @reservation.save
      redirect_to restaurant_path(@restaurant), notice: 'Booking Successfull'
    else
      render 'new'
    end
  end

  def update
    if @reservation.update_attributes(reservation_params)
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end     
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to root_path    
  end

  private
  def set_reservation
    @reservation = Reservation.find(params[:id])  
  end

  def reservation_params
    params.require(:reservation).permit(:id, :restaurant_id, :user_id, :date, :time, :size)
  end 
end
