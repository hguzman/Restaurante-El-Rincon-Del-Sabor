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
