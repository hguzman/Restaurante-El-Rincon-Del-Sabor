class SaleDetail < ApplicationRecord
  belongs_to :sale
  belongs_to :dish

  before_save :almacenar

  def almacenar
    self.preciot = self.cantidad * dish.precio
  end

  # def al1
  #   self.cantidad * dish.precio
  # end

end
