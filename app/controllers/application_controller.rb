class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # This will redirect users after login based on their role
 def after_sign_in_path_for(resource)
  if resource.role == "provider"
    if resource.provider.present?
      providers_path  # provider dashboard
    else
      new_provider_path  # guide them to create their Provider profile
    end
  else
    root_path  # normal users go here
  end
end

    protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end