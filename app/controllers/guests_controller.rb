class GuestsController < ApplicationController
  def index
    @bookings = current_user && current_user.bookings
    @reviews = Review.new
  end
end
