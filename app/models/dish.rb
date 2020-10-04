class Dish < ApplicationRecord
  belongs_to :category
  has_many :sale

  def self.buscador(termino)
    Category.where("nombre LIKE ?", "%#{termino}%")
  end

  def to_s
    self.nombre
  end
end
