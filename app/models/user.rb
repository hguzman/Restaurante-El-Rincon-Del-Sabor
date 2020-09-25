class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :user_mailer
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one :profile

         def user_mailer
           UserMailer.delay(run_at: 2.minutes.from_now).bienvenida_mailer(@user)
         end
         has_many :sales

         has_many :clients

end
