class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path, notice: "Has cerrado sesión."
  end
end
