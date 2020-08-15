class CreateWarehouseRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouse_records do |t|
      t.integer :cantidad
      t.integer :user_id
      t.references :supplier, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
