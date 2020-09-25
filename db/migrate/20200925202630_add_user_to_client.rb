class AddUserToClient < ActiveRecord::Migration[6.0]
  def change
    add_reference :clients, :user, foreign_key: true
  end
end
