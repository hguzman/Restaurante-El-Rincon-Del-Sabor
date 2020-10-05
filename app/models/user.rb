class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def avatar
           email_address = self.email.downcase
           # create the md5 hash
           hash = Digest::MD5.hexdigest(email_address)
           # compile URL which can be used in <img src="RIGHT_HERE"...
           image_src = "https://www.gravatar.com/avatar/#{hash}"
         end
end
