require 'test_helper'

class OrderFrequenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_frequency = order_frequencies(:one)
  end

  test "should get index" do
    get order_frequencies_url
    assert_response :success
  end

  test "should get new" do
    get new_order_frequency_url
    assert_response :success
  end

  test "should create order_frequency" do
    assert_difference('OrderFrequency.count') do
      post order_frequencies_url, params: { order_frequency: { medication_order_id: @order_frequency.medication_order_id, unit: @order_frequency.unit, value: @order_frequency.value } }
    end

    assert_redirected_to order_frequency_url(OrderFrequency.last)
  end

  test "should show order_frequency" do
    get order_frequency_url(@order_frequency)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_frequency_url(@order_frequency)
    assert_response :success
  end

  test "should update order_frequency" do
    patch order_frequency_url(@order_frequency), params: { order_frequency: { medication_order_id: @order_frequency.medication_order_id, unit: @order_frequency.unit, value: @order_frequency.value } }
    assert_redirected_to order_frequency_url(@order_frequency)
  end

  test "should destroy order_frequency" do
    assert_difference('OrderFrequency.count', -1) do
      delete order_frequency_url(@order_frequency)
    end

    assert_redirected_to order_frequencies_url
  end
end
