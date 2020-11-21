class AddSaleDetailsToSale < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :sale_details_id, :integer

  end
end
