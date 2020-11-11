class AddPreciotToSaleDetails < ActiveRecord::Migration[5.2]

  def change
     add_column :sale_details, :preciot, :integer
  end
end
