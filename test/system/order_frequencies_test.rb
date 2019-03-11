require "application_system_test_case"

class OrderFrequenciesTest < ApplicationSystemTestCase
  setup do
    @order_frequency = order_frequencies(:one)
  end

  test "visiting the index" do
    visit order_frequencies_url
    assert_selector "h1", text: "Order Frequencies"
  end

  test "creating a Order frequency" do
    visit order_frequencies_url
    click_on "New Order Frequency"

    fill_in "Medication order", with: @order_frequency.medication_order_id
    fill_in "Unit", with: @order_frequency.unit
    fill_in "Value", with: @order_frequency.value
    click_on "Create Order frequency"

    assert_text "Order frequency was successfully created"
    click_on "Back"
  end

  test "updating a Order frequency" do
    visit order_frequencies_url
    click_on "Edit", match: :first

    fill_in "Medication order", with: @order_frequency.medication_order_id
    fill_in "Unit", with: @order_frequency.unit
    fill_in "Value", with: @order_frequency.value
    click_on "Update Order frequency"

    assert_text "Order frequency was successfully updated"
    click_on "Back"
  end

  test "destroying a Order frequency" do
    visit order_frequencies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order frequency was successfully destroyed"
  end
end
