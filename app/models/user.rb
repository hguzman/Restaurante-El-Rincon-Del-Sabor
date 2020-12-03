class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :user_mailer
  devise :database_authenticatable,
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

         # def avatar
         #   email_address = self.email.downcase
         #   # create the md5 hash
         #   hash = Digest::MD5.hexdigest(email_address)
         #   # compile URL which can be used in <img src="RIGHT_HERE"...
         #   image_src = "https://www.gravatar.com/avatar/#{hash}"
         # end

         def to_s
           "#{self.nombres}" + " " + "#{self.apellidos}" 
         end

end
