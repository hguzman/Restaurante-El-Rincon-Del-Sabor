class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :user_mailer
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         mount_uploader :avatar, AvatarUploader

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
           self.email
         end
end
