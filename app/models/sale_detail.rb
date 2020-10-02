class SaleDetail < ApplicationRecord
  belongs_to :sale
  belongs_to :dish
end
