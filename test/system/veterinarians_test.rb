require "application_system_test_case"

class VeterinariansTest < ApplicationSystemTestCase
  setup do
    @veterinarian = veterinarians(:one)
  end

  test "visiting the index" do
    visit veterinarians_url
    assert_selector "h1", text: "Veterinarians"
  end

  test "creating a Veterinarian" do
    visit veterinarians_url
    click_on "New Veterinarian"

    click_on "Create Veterinarian"

    assert_text "Veterinarian was successfully created"
    click_on "Back"
  end

  test "should create Veterinarian with valid international phone number format" do
    visit veterinarians_url
    click_on "New Veterinarian"

    fill_in "Name", with: "Karl"
    fill_in "Status", with: "available"
    fill_in "Number", with: "+09876589365"

    click_on "Create Veterinarian"

    assert_text "Veterinarian was successfully created"
    click_on "Back"
  end

  test "should not create Veterinarian with invalid international phone number format" do
    visit veterinarians_url
    click_on "New Veterinarian"

    fill_in "Name", with: "Kris"
    fill_in "Status", with: "available"
    fill_in "Number", with: "1234567890"

    click_on "Create Veterinarian"

    assert_text "Phone number must be in a valid international format"
  end

  test "updating a Veterinarian" do
    visit veterinarians_url
    click_on "Edit", match: :first

    click_on "Update Veterinarian"

    assert_text "Veterinarian was successfully updated"
    click_on "Back"
  end

  test "destroying a Veterinarian" do
    visit veterinarians_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Veterinarian was successfully destroyed"
  end
end
