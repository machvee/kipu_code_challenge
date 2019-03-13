require 'test_helper'

class Admin::FacilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facility = facilities(:one)
  end

  test "should get index" do
    get admin_facilities_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_facility_url
    assert_response :success
  end

  test "should create facility" do
    assert_difference('Facility.count') do
      post admin_facilities_url, params: { facility: { name: @facility.name } }
    end

    assert_redirected_to admin_facility_url(Facility.last)
  end

  test "should show facility" do
    get admin_facility_url(@facility)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_facility_url(@facility)
    assert_response :success
  end

  test "should update facility" do
    patch admin_facility_url(@facility), params: { facility: { name: @facility.name } }
    assert_redirected_to admin_facility_url(@facility)
  end

  test "should destroy facility" do
    assert_difference('Facility.count', -1) do
      delete admin_facility_url(@facility)
    end

    assert_redirected_to admin_facilities_url
  end
end
