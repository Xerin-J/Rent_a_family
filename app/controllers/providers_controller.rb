class ProvidersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @provider = current_user.provider
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = current_user.build_provider(provider_params)
    if @provider.save
      redirect_to providers_path, notice: "Account successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def provider_params
    params.require(:provider).permit(:first_name, :last_name, :address, :some_provider_fields)
  end
end
