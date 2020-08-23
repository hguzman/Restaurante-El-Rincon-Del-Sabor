require 'test_helper'

class Categories::DishesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categories_dishes_index_url
    assert_response :success
  end

  test "should get new" do
    get categories_dishes_new_url
    assert_response :success
  end

  test "should get create" do
    get categories_dishes_create_url
    assert_response :success
  end

  test "should get show" do
    get categories_dishes_show_url
    assert_response :success
  end

end
