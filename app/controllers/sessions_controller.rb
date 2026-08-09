class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: session_params[:email].to_s.strip.downcase)

    if user&.verified?
      session[:user_id] = user.id
      redirect_to new_issue_path, notice: "Iniciaste sesión correctamente."
    else
      @user = User.new
      render :new, status: :unprocessable_entity, alert: "El correo no está verificado o no existe."
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Has cerrado sesión."
  end

  private

  def session_params
    params.require(:user).permit(:email)
  end
end
