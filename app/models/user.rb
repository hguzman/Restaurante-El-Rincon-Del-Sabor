# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  apellidos              :string
#  avatar                 :string
#  cedula                 :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  direccion              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  nombres                :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sexo                   :string
#  telefono               :string
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
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
           "#{self.nombres}" + " " + "#{self.apellidos}" 
         end

end
