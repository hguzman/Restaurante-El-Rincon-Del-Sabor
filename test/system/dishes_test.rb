require "application_system_test_case"

class DishesTest < ApplicationSystemTestCase
  setup do
    @dish = dishes(:one)
  end

  test "visiting the index" do
    visit dishes_url
    assert_selector "h1", text: "Dishes"
  end

  test "creating a Dish" do
    visit dishes_url
    click_on "New Dish"

    fill_in "Category", with: @dish.category_id
    fill_in "Descripcion", with: @dish.descripcion
    fill_in "Existencia", with: @dish.existencia
    fill_in "Nombre", with: @dish.nombre
    fill_in "Precio", with: @dish.precio
    click_on "Create Dish"

    assert_text "Dish was successfully created"
    click_on "Back"
  end

  test "updating a Dish" do
    visit dishes_url
    click_on "Edit", match: :first

    fill_in "Category", with: @dish.category_id
    fill_in "Descripcion", with: @dish.descripcion
    fill_in "Existencia", with: @dish.existencia
    fill_in "Nombre", with: @dish.nombre
    fill_in "Precio", with: @dish.precio
    click_on "Update Dish"

    assert_text "Dish was successfully updated"
    click_on "Back"
  end

  test "destroying a Dish" do
    visit dishes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dish was successfully destroyed"
  end
end
