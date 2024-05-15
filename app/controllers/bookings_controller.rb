class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :new, :create]
  def index
    @bookings = Booking.where(user_id: current_user.id)
    #For each of the bookings return the results before the created date timestamp
    @booking_infos = []
    @bookings.each do |booking|
      @booking_infos << {
        booking: booking,
        queue_position: Booking.where("restaurant_id=? AND created_at <= ? AND accepted = false",booking.restaurant_id, booking.created_at).count
      }

    end
  end

  def show

  end

  def new

  end

  def create
    raise
    booking= Booking.new(booking_params)
    #booking= Booking.new(user:current_user,restaurant_id:params[:id])
    if booking.save
      redirect_to bookings_path
    else
      redirect_to restaurant_path(params[:id])
    end
  end

  def join_queue
    #booking= Booking.new(booking_params)
    @restaurant= Restaurant.find(params[:restaurant_id])
    booking= Booking.new(user:current_user,restaurant: @restaurant)
    if booking.save
      redirect_to bookings_path
    else
      redirect_to restaurant_path(params[:id])
    end
  end

  def destroy

  end

  private
  def booking_params
    params.require(:booking).permit(:name)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
