class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to root_path, notice: "You have been signed out."
  end
end
