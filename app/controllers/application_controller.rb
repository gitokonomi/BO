class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?



  private

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admin_recruitings_path
      when User
        recruitings_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      new_user_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
