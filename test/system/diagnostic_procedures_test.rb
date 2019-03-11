require "application_system_test_case"

class DiagnosticProceduresTest < ApplicationSystemTestCase
  setup do
    @diagnostic_procedure = diagnostic_procedures(:one)
  end

  test "visiting the index" do
    visit diagnostic_procedures_url
    assert_selector "h1", text: "Diagnostic Procedures"
  end

  test "creating a Diagnostic procedure" do
    visit diagnostic_procedures_url
    click_on "New Diagnostic Procedure"

    fill_in "Description", with: @diagnostic_procedure.description
    fill_in "Moment", with: @diagnostic_procedure.moment
    fill_in "Patient", with: @diagnostic_procedure.patient_id
    click_on "Create Diagnostic procedure"

    assert_text "Diagnostic procedure was successfully created"
    click_on "Back"
  end

  test "updating a Diagnostic procedure" do
    visit diagnostic_procedures_url
    click_on "Edit", match: :first

    fill_in "Description", with: @diagnostic_procedure.description
    fill_in "Moment", with: @diagnostic_procedure.moment
    fill_in "Patient", with: @diagnostic_procedure.patient_id
    click_on "Update Diagnostic procedure"

    assert_text "Diagnostic procedure was successfully updated"
    click_on "Back"
  end

  test "destroying a Diagnostic procedure" do
    visit diagnostic_procedures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Diagnostic procedure was successfully destroyed"
  end
end
