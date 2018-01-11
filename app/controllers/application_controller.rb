class ApplicationController < ActionController::Base
	
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:username,:last_name,:first_name,:mobile_number])
  end
  rescue_from CanCan::AccessDenied do 
  	redirect_to root_path,notice: "the page you are looking for doesn't exit"
  end
end

