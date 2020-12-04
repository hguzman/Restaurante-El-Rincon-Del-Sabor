class Category < ApplicationRecord
  has_many :dishes, dependent: :destroy

  validates :nombre, format: { with: /\A[a-z A-Z]+\z/, message: "debe incluir sólo letras" }
  validates :descripcion, format: { with: /\A[a-z A-Z]+\z/, message: "debe incluir sólo letras" }
end
