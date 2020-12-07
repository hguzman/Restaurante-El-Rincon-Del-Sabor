# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  cedula     :string
#  correo     :string
#  direccion  :string
#  estado     :boolean
#  nombre     :string
#  telefono   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Client < ApplicationRecord
  has_many :sales, dependent: :destroy
  validates :nombre, format: { with: /\A[a-z A-Z]+\z/, message: "debe incluir sólo letras" }
  validates_format_of :correo,{with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'debe ser válido!'}
  validates :direccion, presence: true
  validates :cedula, length: { in: 7..10 },numericality: true
  validates :telefono, length: { in: 7..10 },numericality: true

  def to_s
    self.nombre
  end
  
end
