class Category < ApplicationRecord
  has_many :dishes, dependent: :destroy

    def self.buscador(termino)
      Category.where("nombre LIKE ?", "%#{termino}%")
    end

end
