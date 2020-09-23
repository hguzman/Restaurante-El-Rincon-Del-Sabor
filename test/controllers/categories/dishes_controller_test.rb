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

  test "should get edit" do
    get categories_dishes_edit_url
    assert_response :success
  end

  test "should get show" do
    get categories_dishes_show_url
    assert_response :success
  end

end
