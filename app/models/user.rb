class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :user_mailer
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one :profile

          def send_devise_notification(notification, *args)
           devise_mailer.send(notification, self, *args).deliver_later
          end

          def user_mailer
            UserMailer.delay.bienvenida_mailer(@user)
          end
end
