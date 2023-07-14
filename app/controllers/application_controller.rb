class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?

  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!, unless: %i[devise_controller? request_method_is_get?]

  def resource_class
    User
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :surname, :username, :email, :password)
    end
  end

  def request_method_is_get?
    request.method == 'GET'
  end
end
