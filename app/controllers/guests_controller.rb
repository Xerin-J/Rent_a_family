class GuestsController < ApplicationController

  def index
    @reviews = Review.new
    if current_user&.guest
      @bookings = current_user.guest.bookings.includes(:family)
    else
      @bookings = []
  end
end

  def new
    @guest = Guest.new
  end

  def create
    @guest = current_user.build_guest(guest_params)
    if @guest.save
      redirect_to guests_path, notice: "Account successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :address, :photo)
  end
end
