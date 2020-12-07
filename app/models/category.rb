# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  descripcion :string
#  nombre      :string
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_categories_on_slug  (slug) UNIQUE
#
class Category < ApplicationRecord

  # extend FriendlyId
  # friendly_id :nombre, use: :slugged

  has_many :dishes, dependent: :destroy

  validates :nombre, format: { with: /\A[a-z A-Z]+\z/, message: "debe incluir sólo letras" }
  validates :descripcion, format: { with: /\A[a-z A-Z]+\z/, message: "debe incluir sólo letras" }

end
