require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categories_index_url
    assert_response :success
  end

  test "should get create" do
    get categories_create.js.erb_url
    assert_response :success
  end

  test "should get new" do
    get categories_new.js.erb_url
    assert_response :success
  end

end
