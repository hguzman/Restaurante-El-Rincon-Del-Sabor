class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.bienvenida_mailer.subject
  #
  def bienvenida_mailer(user)
    @user = User.last
    mail(to: @user.email, subject: 'Bienvenidos a Garvsoft')
  end
end
