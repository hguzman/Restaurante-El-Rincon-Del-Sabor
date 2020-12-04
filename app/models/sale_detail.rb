class SaleDetail < ApplicationRecord
  belongs_to :sale
  belongs_to :dish
  validates :cantidad, inclusion: { in: 0..20 } 


  before_save :almacenar
  after_save :descontar

  def almacenar
    self.preciot = self.cantidad * dish.precio
  end

  def descontar
    self.dish.existencia -= self.cantidad
    self.dish.save
  end
  
  # def al1
  #   self.cantidad * dish.precio
  # end

end
