# == Schema Information
#
# Table name: dishes
#
#  id          :integer          not null, primary key
#  descripcion :string
#  existencia  :integer
#  nombre      :string
#  precio      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
# Indexes
#
#  index_dishes_on_category_id  (category_id)
#
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
