class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  before_action :confgure_permitted_parameters, if: :devise_controller?

  protected
  def confgure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname])
  end
end
