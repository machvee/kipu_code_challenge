require 'test_helper'

class TemplateFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @template_field = template_fields(:one)
  end

  test "should get index" do
    get template_fields_url
    assert_response :success
  end

  test "should get new" do
    get new_template_field_url
    assert_response :success
  end

  test "should create template_field" do
    assert_difference('TemplateField.count') do
      post template_fields_url, params: { template_field: { field_name: @template_field.field_name, placeholder: @template_field.placeholder } }
    end

    assert_redirected_to template_field_url(TemplateField.last)
  end

  test "should show template_field" do
    get template_field_url(@template_field)
    assert_response :success
  end

  test "should get edit" do
    get edit_template_field_url(@template_field)
    assert_response :success
  end

  test "should update template_field" do
    patch template_field_url(@template_field), params: { template_field: { field_name: @template_field.field_name, placeholder: @template_field.placeholder } }
    assert_redirected_to template_field_url(@template_field)
  end

  test "should destroy template_field" do
    assert_difference('TemplateField.count', -1) do
      delete template_field_url(@template_field)
    end

    assert_redirected_to template_fields_url
  end
end
