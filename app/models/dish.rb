class Dish < ApplicationRecord
  has_many :sale_details, dependent: :destroy
  belongs_to :category
  # has_many :sale_details

  validates :nombre, format: { with: /\A[a-z A-Z]+\z/, message: "debe incluir sólo letras" }
  validates :existencia, length: { in: 1..10 },numericality: true
  validates :precio, presence:true
  validates :descripcion, format: { with: /\A[a-z A-Z]+\z/, message: "debe incluir sólo letras" }
  def to_s
    self.nombre
  end
end
