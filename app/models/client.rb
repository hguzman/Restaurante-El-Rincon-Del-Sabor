class Client < ApplicationRecord
  has_many :sales
  validates :nombre, format: { with: /\A[a-z A-Z]+\z/, message: "debe incluir sólo letras" }
  validates_format_of :correo,{with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'debe ser válido!'}
  validates :direccion, presence: true
  validates :cedula, length: { in: 10..10 },numericality: true
  validates :telefono, length: { in: 10..10 },numericality: true

   def to_s
      self.nombre
     # "#{self.cedula} - #{self.nombre}"
   end

end
