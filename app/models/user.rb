class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :user_mailer
  devise :database_authenticatable,  :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :registerable
         # required_methods = [:confirmation_token, :confirmed_at, :confirmation_sent_at]
         mount_uploader :avatar, AvatarUploader, optional: true

          has_many :sales, dependent: :destroy
         def send_devise_notification(notification, *args)
           devise_mailer.send(notification, self, *args).deliver_later
         end


           def user_mailer
             UserMailer.delay.bienvenida_mailer(@user)
           end

         def to_s
           self.email
         end

end
