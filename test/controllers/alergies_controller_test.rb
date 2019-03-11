require 'test_helper'

class AlergiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alergy = alergies(:one)
  end

  test "should get index" do
    get alergies_url
    assert_response :success
  end

  test "should get new" do
    get new_alergy_url
    assert_response :success
  end

  test "should create alergy" do
    assert_difference('Alergy.count') do
      post alergies_url, params: { alergy: { description: @alergy.description, patient_id: @alergy.patient_id } }
    end

    assert_redirected_to alergy_url(Alergy.last)
  end

  test "should show alergy" do
    get alergy_url(@alergy)
    assert_response :success
  end

  test "should get edit" do
    get edit_alergy_url(@alergy)
    assert_response :success
  end

  test "should update alergy" do
    patch alergy_url(@alergy), params: { alergy: { description: @alergy.description, patient_id: @alergy.patient_id } }
    assert_redirected_to alergy_url(@alergy)
  end

  test "should destroy alergy" do
    assert_difference('Alergy.count', -1) do
      delete alergy_url(@alergy)
    end

    assert_redirected_to alergies_url
  end
end
