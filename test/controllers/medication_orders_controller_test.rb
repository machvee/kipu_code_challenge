require 'test_helper'

class MedicationOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medication_order = medication_orders(:one)
  end

  test "should get index" do
    get medication_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_medication_order_url
    assert_response :success
  end

  test "should create medication_order" do
    assert_difference('MedicationOrder.count') do
      post medication_orders_url, params: { medication_order: { dosage: @medication_order.dosage, name: @medication_order.name, necessity: @medication_order.necessity, patient_id: @medication_order.patient_id, route: @medication_order.route, unit: @medication_order.unit } }
    end

    assert_redirected_to medication_order_url(MedicationOrder.last)
  end

  test "should show medication_order" do
    get medication_order_url(@medication_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_medication_order_url(@medication_order)
    assert_response :success
  end

  test "should update medication_order" do
    patch medication_order_url(@medication_order), params: { medication_order: { dosage: @medication_order.dosage, name: @medication_order.name, necessity: @medication_order.necessity, patient_id: @medication_order.patient_id, route: @medication_order.route, unit: @medication_order.unit } }
    assert_redirected_to medication_order_url(@medication_order)
  end

  test "should destroy medication_order" do
    assert_difference('MedicationOrder.count', -1) do
      delete medication_order_url(@medication_order)
    end

    assert_redirected_to medication_orders_url
  end
end
