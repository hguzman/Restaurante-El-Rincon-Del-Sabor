class CreateSaleDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_details do |t|
      t.integer :cantidad
      t.references :sale, foreign_key: true
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end
