require 'test_helper'

class Sales::SaleDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sales_sale_details_index_url
    assert_response :success
  end

end
