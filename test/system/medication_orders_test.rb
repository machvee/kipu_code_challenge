require "application_system_test_case"

class MedicationOrdersTest < ApplicationSystemTestCase
  setup do
    @medication_order = medication_orders(:one)
  end

  test "visiting the index" do
    visit medication_orders_url
    assert_selector "h1", text: "Medication Orders"
  end

  test "creating a Medication order" do
    visit medication_orders_url
    click_on "New Medication Order"

    fill_in "Dosage", with: @medication_order.dosage
    fill_in "Name", with: @medication_order.name
    fill_in "Necessity", with: @medication_order.necessity
    fill_in "Patient", with: @medication_order.patient_id
    fill_in "Route", with: @medication_order.route
    fill_in "Unit", with: @medication_order.unit
    click_on "Create Medication order"

    assert_text "Medication order was successfully created"
    click_on "Back"
  end

  test "updating a Medication order" do
    visit medication_orders_url
    click_on "Edit", match: :first

    fill_in "Dosage", with: @medication_order.dosage
    fill_in "Name", with: @medication_order.name
    fill_in "Necessity", with: @medication_order.necessity
    fill_in "Patient", with: @medication_order.patient_id
    fill_in "Route", with: @medication_order.route
    fill_in "Unit", with: @medication_order.unit
    click_on "Update Medication order"

    assert_text "Medication order was successfully updated"
    click_on "Back"
  end

  test "destroying a Medication order" do
    visit medication_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Medication order was successfully destroyed"
  end
end
