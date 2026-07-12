class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_verified_user
    return if current_user&.verified?

    redirect_to signup_path, alert: "You must register and verify your email before reporting an issue."
  end
end
