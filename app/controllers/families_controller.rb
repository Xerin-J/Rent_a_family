class FamiliesController < ApplicationController

  def index
    if params[:query].present?
      sql_subquery = "event_type @@ :query OR location @@ :query"
      @families = Family.where(sql_subquery, query: "%#{params[:query]}%")
    else
      @families = Family.all
    end
  end

  def show
    @family = Family.find(params[:id])
    @booking = Booking.new
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    provider = current_user.provider
    unless provider
      redirect_to new_provider_path, alert: "Please create your provider profile first."
      return
    end
    @family.provider = provider
    if @family.save
      redirect_to providers_path, notice: "Your family entry was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def family_params
    params.require(:family).permit(:members, :location, :event_type, :hourly_rate)
  end
end
