class VerificationsController < ApplicationController
  def show
    user = User.find_by(verification_token: params[:token])

    if user
      unless user.verified?
        user.verify!
        notice_msg = "¡Bienvenido! Tu correo ha sido verificado. Ahora puedes reportar incidencias."
      else
        notice_msg = "Tu correo ya estaba verificado. Bienvenido de nuevo."
      end

      session[:user_id] = user.id
      redirect_to new_issue_path, notice: notice_msg
    else
      redirect_to login_path, alert: "El enlace de verificación no es válido o ha expirado. Por favor, regístrate nuevamente."
    end
  end
end
