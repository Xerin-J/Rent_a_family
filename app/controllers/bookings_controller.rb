class BookingsController < ApplicationController
  def index
    @bookings = Booking.find(current_user.id)
  end

  def new
    @family = Family.find(params[:family_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = 1
    @booking.user = current_user
    @booking.family = Family.find(params[:family_id])
    if @booking.save
      redirect_to root_path(@booking.family), notice: "Your booking entry was successfully created!"
    else
      redirect_to families_path(@family), status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[id:])
  end

  private
  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :total_cost)
  end
end
