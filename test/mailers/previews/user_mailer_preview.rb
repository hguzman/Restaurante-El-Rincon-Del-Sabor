# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/bienvenida_mailer
  def bienvenida_mailer
    UserMailer.bienvenida_mailer
  end

end
