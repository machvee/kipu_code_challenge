require 'test_helper'

module Admin
  class TemplateFieldsControllerTest < ActionDispatch::IntegrationTest
    setup do
      @template_field = template_fields(:one)
    end

    test "should get index" do
      get admin_facility_template_fields_url
      assert_response :success
    end

    test "should get new" do
      get new_admin_facility_template_field_url
      assert_response :success
    end

    test "should create template_field" do
      assert_difference('TemplateField.count') do
        post admin_facility_template_fields_url, params: { template_field: { field_name: @template_field.field_name, placeholder: @template_field.placeholder, facility_id: @template_field.facility_id } }
      end

      assert_redirected_to admin_facility_template_field_url(TemplateField.last)
    end

    test "should show template_field" do
      get admin_facility_template_field_url(@template_field)
      assert_response :success
    end

    test "should get edit" do
      get edit_admin_facility_template_field_url(@template_field)
      assert_response :success
    end

    test "should update template_field" do
      patch admin_facility_template_field_url(@template_field), params: { template_field: { field_name: @template_field.field_name, placeholder: @template_field.placeholder } }
      assert_redirected_to admin_facility_template_field_url(@template_field)
    end

    test "should destroy template_field" do
      assert_difference('TemplateField.count', -1) do
        delete admin_facility_template_field_url(@template_field)
      end

      assert_redirected_to admin_facility_template_fields_url
    end
  end
end
