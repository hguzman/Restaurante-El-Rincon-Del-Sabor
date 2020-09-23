class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :nombre
      t.string :direccion
      t.string :foto
      t.string :telefono
      t.string :cedula
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
