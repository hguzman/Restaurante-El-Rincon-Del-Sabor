class Dish < ApplicationRecord
  has_many :sale_details, dependent: :destroy
  belongs_to :category
  # has_many :sale_details

  def to_s
    self.nombre
  end
end
