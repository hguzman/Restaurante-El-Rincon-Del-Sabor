class AddDishIdToSaleDetails < ActiveRecord::Migration[6.0]
  def change
    add_reference :sale_details, :dish, index: true
    add_foreign_key :sale_details, :dishes
  end
end
