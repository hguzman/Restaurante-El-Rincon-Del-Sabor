class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      # t.integer :total
      t.integer :total, default: 0
      t.references :client, null: false, foreign_key: true
      t.timestamps
    end
  end
end
