require "application_system_test_case"

class TreatmentModelsTest < ApplicationSystemTestCase
  setup do
    @treatment_model = treatment_models(:one)
  end

  test "visiting the index" do
    visit treatment_models_url
    assert_selector "h1", text: "Treatment Models"
  end

  test "creating a Treatment model" do
    visit treatment_models_url
    click_on "New Treatment Model"

    fill_in "Description", with: @treatment_model.description
    fill_in "Necessity", with: @treatment_model.necessity
    fill_in "Patient", with: @treatment_model.patient_id
    click_on "Create Treatment model"

    assert_text "Treatment model was successfully created"
    click_on "Back"
  end

  test "updating a Treatment model" do
    visit treatment_models_url
    click_on "Edit", match: :first

    fill_in "Description", with: @treatment_model.description
    fill_in "Necessity", with: @treatment_model.necessity
    fill_in "Patient", with: @treatment_model.patient_id
    click_on "Update Treatment model"

    assert_text "Treatment model was successfully updated"
    click_on "Back"
  end

  test "destroying a Treatment model" do
    visit treatment_models_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Treatment model was successfully destroyed"
  end
end
