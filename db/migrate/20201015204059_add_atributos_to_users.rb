class AddAtributosToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nombres, :string
    add_column :users, :apellidos, :string
    add_column :users, :cedula, :string
    add_column :users, :direccion, :string
    add_column :users, :telefono, :string
    add_column :users, :sexo, :string
  end
end
