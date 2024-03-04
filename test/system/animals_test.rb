require "application_system_test_case"

class AnimalsTest < ApplicationSystemTestCase
  setup do
    @animal = animals(:one)
  end

  test "visiting the index" do
    visit animals_url
    assert_selector "h1", text: "Animals"
  end

  test "creating a Animal" do
    visit animals_url
    click_on "New Animal"

    click_on "Create Animal"

    assert_text "Animal was successfully created"
    click_on "Back"
  end

  # test to check if animals are not created with duplicate unique tags
  test "does not allow creating an animal with a duplicate unique_tag" do
    visit animals_url
    click_on "New Animal"

    fill_in "Unique tag", with: @animal.unique_tag
    click_on "Create Animal"

    assert_text "Unique tag has already been taken"
  end

  test "updating a Animal" do
    visit animals_url
    click_on "Edit", match: :first

    click_on "Update Animal"

    assert_text "Animal was successfully updated"
    click_on "Back"
  end

  test "destroying a Animal" do
    visit animals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Animal was successfully destroyed"
  end
end