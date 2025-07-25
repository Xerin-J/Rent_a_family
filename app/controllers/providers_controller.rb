class ProvidersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @provider = current_user.provider
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end
end
