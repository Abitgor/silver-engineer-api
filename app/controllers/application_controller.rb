class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def current_token
    request.env['warden-jwt_auth.token']
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name description title])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
