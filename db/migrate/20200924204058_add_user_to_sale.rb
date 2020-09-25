class AddUserToSale < ActiveRecord::Migration[6.0]
  def change
    add_reference :sales, :user, foreign_key: true
  end
end
