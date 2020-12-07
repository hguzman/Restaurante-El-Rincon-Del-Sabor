# == Schema Information
#
# Table name: sale_details
#
#  id         :integer          not null, primary key
#  cantidad   :integer
#  preciot    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dish_id    :integer
#  sale_id    :integer
#
# Indexes
#
#  index_sale_details_on_dish_id  (dish_id)
#  index_sale_details_on_sale_id  (sale_id)
#
class SaleDetail < ApplicationRecord
  belongs_to :sale
  belongs_to :dish
  validates :cantidad, inclusion: { in: 1..10 }


  before_save :almacenar
  after_save :descontar
  after_destroy :rollback

  def almacenar
    self.preciot = self.cantidad * dish.precio
  end

  def descontar
    if self.cantidad < self.dish.existencia
      self.dish.existencia -= self.cantidad
      self.dish.save
    end
  end

  def rollback
    self.dish.existencia += self.cantidad
    self.dish.save
  end

  # def al1
  #   self.cantidad * dish.precio
  # end

end
