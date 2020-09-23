class UserMailer < ApplicationMailer

  def bienvenida_mailer(user)
    @user = User.last
    mail(to: @user.email, subject: 'Bienvenidos a Garvsoft')
  end
end
