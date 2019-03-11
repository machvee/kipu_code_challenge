require "application_system_test_case"

class AlergiesTest < ApplicationSystemTestCase
  setup do
    @alergy = alergies(:one)
  end

  test "visiting the index" do
    visit alergies_url
    assert_selector "h1", text: "Alergies"
  end

  test "creating a Alergy" do
    visit alergies_url
    click_on "New Alergy"

    fill_in "Description", with: @alergy.description
    fill_in "Patient", with: @alergy.patient_id
    click_on "Create Alergy"

    assert_text "Alergy was successfully created"
    click_on "Back"
  end

  test "updating a Alergy" do
    visit alergies_url
    click_on "Edit", match: :first

    fill_in "Description", with: @alergy.description
    fill_in "Patient", with: @alergy.patient_id
    click_on "Update Alergy"

    assert_text "Alergy was successfully updated"
    click_on "Back"
  end

  test "destroying a Alergy" do
    visit alergies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Alergy was successfully destroyed"
  end
end
