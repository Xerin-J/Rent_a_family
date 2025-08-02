class BookingsController < ApplicationController
  before_action :set_family, only: [:new, :create]
  before_action :set_booking, only: [:show, :update]

  def index
    # List bookings for the current user's guest profile, or empty array if none
    @bookings = current_user.guest ? current_user.guest.bookings : []
  end

  def new
    @booking = Booking.new
  end

  def show
    # @booking is set by before_action
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = :pending
    @booking.guest = current_user.guest
    @booking.family = @family

    if @booking.save
      redirect_to guests_path, notice: "Your booking entry was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to providers_path, notice: "Booking updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_family
    @family = Family.find(params[:family_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :start_hour, :end_hour, :total_cost, :status)
  end
end