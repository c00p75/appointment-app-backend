class ApplicationController < ActionController::API
  before_action :update_request_parameters, if: :devise_is_sign_in?
  before_action :update_allowed_parameters, if: :devise_controller?

  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_devise_api_token!, unless: %i[devise_controller? request_method_is_get?]
  before_action :set_current_user!, unless: %i[devise_controller?]

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

  def set_current_user!
    devise_api_token = current_devise_api_token
    @current_user = devise_api_token&.resource_owner
  end

  def update_request_parameters
    return if email?(params[:email])

    user = User.where('LOWER(username) = ?', params[:email].downcase).first
    return unless user.present?

    params[:email] = user.email
  end

  def devise_is_sign_in?
    devise_controller? && params[:action] == 'sign_in'
  end

  def email?(email)
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    email =~ email_regex
  end
end
