# == Schema Information
#
# Table name: dishes
#
#  id          :integer          not null, primary key
#  descripcion :string
#  existencia  :integer
#  nombre      :string
#  precio      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
# Indexes
#
#  index_dishes_on_category_id  (category_id)
#
require 'test_helper'

class DishTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
