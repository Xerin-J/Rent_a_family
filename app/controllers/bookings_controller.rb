class BookingsController < ApplicationController
  def index
    @bookings = Booking.find(current_user.id)
  end

  def new
    @booking = Booking.new
  end
  def create
    @booking = Booking.new(booking_params)
    @booking.status = 1
    @booking.user_id = current_user.id
    @booking.family_id = params[:id]
    if @booking.save
      redirect_to @booking, notice: "Your booking entry was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @booking = Booking.find(params[id:])
  end

  private
  def booking_params
    params.require(booking).permit(:start_time, :end_time, :location, :event_type, :total_cost)
  end
end
