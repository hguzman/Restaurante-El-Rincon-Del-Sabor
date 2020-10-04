class CreateSaleDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :sale_details do |t|
      t.integer :cantidad, default: 1
      t.references :sale, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true

      t.timestamps
    end
  end
end
