class SaleDetail < ApplicationRecord
  belongs_to :sale
  belongs_to :dish

  before_save :almacenar
  before_save :descontar

  def almacenar
    self.preciot = self.cantidad * dish.precio
  end

  def descontar
    self.cantidad - dish.existencia
  end
  
  # def al1
  #   self.cantidad * dish.precio
  # end

end
