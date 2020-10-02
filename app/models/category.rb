class Category < ApplicationRecord
  has_many :dishes, dependent: :destroy

  def to_s
    self.nombre
  end

end
