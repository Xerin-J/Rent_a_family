class BookingsController < ApplicationController
  def index
    @bookings = Booking.find(current_user.id)
  end

  def new
    @family = Family.find(params[:family_id])
    @booking = Booking.new
  end

    def show
    @booking = Booking.find(params[id:])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = 0
    @booking.user = current_user
    @booking.family = Family.find(params[:family_id])
    if @booking.save
      redirect_to guests_path(@booking.family), notice: "Your booking entry was successfully created!"
    else
      redirect_to families_path(@family), status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to providers_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :start_hour, :end_hour, :total_cost, :status)
  end
end
