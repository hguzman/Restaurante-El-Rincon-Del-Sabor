class Dish < ApplicationRecord
  belongs_to :category
  has_many :sale_details
  def self.buscador(termino)
    Dish.where("nombre LIKE ?", "%#{termino}%")
  end
end
