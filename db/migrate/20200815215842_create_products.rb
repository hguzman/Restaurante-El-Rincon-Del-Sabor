class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :existence
      t.decimal :price
      t.references :categories, null: false, foreign_key: true
      t.references :suppliers, null: false, foreign_key: true

      t.timestamps
    end
  end
end
