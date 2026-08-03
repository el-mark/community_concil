class UserMailer < ApplicationMailer
  def verification(user)
    @user = user
    @verify_url = verify_url(token: user.verification_token)

    mail to: user.email, subject: "Verifica tu correo electrónico — Junta Vecinal"
  end
end
