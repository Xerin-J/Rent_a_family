class FamiliesController < ApplicationController

  def index
    @families = Family.all
  end

  def show
    @family = Family.find(params[:id])
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    
    if @family.save
      redirect_to @family, notice: "Your family entry was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def family_params
    params.require(:family).permit(:members, :location, :event_type, :hourly_rate)
  end
end
