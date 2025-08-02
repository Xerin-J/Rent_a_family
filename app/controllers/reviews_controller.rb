class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @reviews = Review.new
  end

  def create
    @reviews = Review.new(review_params)
    @reviews.user = current_user
    @booking = Booking.find(review_params[:booking_id])
    @reviews.family = @booking.family
    if @reviews.save
      redirect_to families_path, notice: "Thanks for your review"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reviews = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :booking_id )
  end
end
