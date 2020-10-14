class AddUserToClient < ActiveRecord::Migration[5.2]
  def change
    add_reference :clients, :user, foreign_key: true
  end
end
