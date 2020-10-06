class Dish < ApplicationRecord
  has_many :sale_details
  belongs_to :category
  # has_many :sale_details

  def to_s
    self.nombre
  end
end
