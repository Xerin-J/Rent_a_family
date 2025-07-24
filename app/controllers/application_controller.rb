class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.role == "provider"
      providers_path # your provider dashboard path helper
    else
      root_path  # guest or normal user landing page
    end
  end
end