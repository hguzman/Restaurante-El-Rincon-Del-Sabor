# == Schema Information
#
# Table name: sale_details
#
#  id         :integer          not null, primary key
#  cantidad   :integer
#  preciot    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dish_id    :integer
#  sale_id    :integer
#
# Indexes
#
#  index_sale_details_on_dish_id  (dish_id)
#  index_sale_details_on_sale_id  (sale_id)
#
require 'test_helper'

class SaleDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
