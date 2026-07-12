class VerificationsController < ApplicationController
  def show
    user = User.find_by(verification_token: params[:token])

    if user
      user.verify! unless user.verified?
      session[:user_id] = user.id
      redirect_to new_issue_path, notice: "Your email has been verified. You can now report issues."
    else
      redirect_to signup_path, alert: "Invalid verification link."
    end
  end
end
