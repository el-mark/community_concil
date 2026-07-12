class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_or_initialize_by(email: user_params[:email].to_s.strip.downcase)

    if @user.new_record? ? @user.save : true
      UserMailer.verification(@user).deliver_later
      render :check_email
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
