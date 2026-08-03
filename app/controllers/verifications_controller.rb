class VerificationsController < ApplicationController
  def show
    user = User.find_by(verification_token: params[:token])

    if user
      user.verify! unless user.verified?
      session[:user_id] = user.id
      redirect_to new_issue_path, notice: "Tu correo electrónico ha sido verificado. Ya puedes reportar problemas."
    else
      redirect_to signup_path, alert: "El enlace de verificación no es válido."
    end
  end
end
