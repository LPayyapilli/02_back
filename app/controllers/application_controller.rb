class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :json_request?
  force_ssl if: :ssl_configured?

  protected

  def ssl_configured?
    !Rails.env.development?
  end

  def json_request?
    # use if more than json returned
    # request.format.json?
    request.format = :json
  end

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  # helper_method :current_user

  # def authorize
  #   redirect_to '/login' unless current_user
  # end
end
