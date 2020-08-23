class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :nombre
      t.integer :precio
      t.integer :existencia
      t.string :descripcion
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
