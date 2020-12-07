# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  cedula     :string
#  correo     :string
#  direccion  :string
#  estado     :boolean
#  nombre     :string
#  telefono   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
