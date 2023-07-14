class ApplicationController < ActionController::API
  before_action :update_allowed_parameters, if: :devise_controller?

  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!, unless: [:devise_controller?, :get_request?]

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

  def get_request?
    request.method == "GET"
  end
end
