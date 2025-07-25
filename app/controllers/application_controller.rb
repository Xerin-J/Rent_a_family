class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # This will redirect users after login based on their role
  def after_sign_in_path_for(resource)
    if resource.role == "provider"
      providers_path  # provider dashboard path
    else
      root_path       # regular user landing page
    end
  end

    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end