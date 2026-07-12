class UserMailer < ApplicationMailer
  def verification(user)
    @user = user
    @verify_url = verify_url(token: user.verification_token)

    mail to: user.email, subject: "Verify your email — Community Council"
  end
end
