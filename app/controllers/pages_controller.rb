class PagesController < ApplicationController
  before_action :configure_devise_params, only: [:home]

  def home
      @bookings = current_user && current_user.bookings
    # now your view will have access to resource, resource_name, and devise_mapping
  end

  private

  def configure_devise_params
    # These variables are expected by Devise form helpers
    self.resource = User.new
    self.resource_name = :user
    self.devise_mapping = Devise.mappings[:user]
  end

  # You need to add these as helper methods so views can access them:
  helper_method :resource, :resource_name, :devise_mapping

  attr_accessor :resource, :resource_name, :devise_mapping
end
