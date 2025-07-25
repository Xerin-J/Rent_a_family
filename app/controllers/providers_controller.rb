class ProvidersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @provider = current_user.provider
  end

  def new
    @provider = Provider.new
  end

  def create
  end

  def update
  end
end
