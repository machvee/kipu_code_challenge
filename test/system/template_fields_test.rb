require "application_system_test_case"

class TemplateFieldsTest < ApplicationSystemTestCase
  setup do
    @template_field = template_fields(:one)
  end

  test "visiting the index" do
    visit template_fields_url
    assert_selector "h1", text: "Template Fields"
  end

  test "creating a Template field" do
    visit template_fields_url
    click_on "New Template Field"

    fill_in "Field name", with: @template_field.field_name
    fill_in "Placeholder", with: @template_field.placeholder
    click_on "Create Template field"

    assert_text "Template field was successfully created"
    click_on "Back"
  end

  test "updating a Template field" do
    visit template_fields_url
    click_on "Edit", match: :first

    fill_in "Field name", with: @template_field.field_name
    fill_in "Placeholder", with: @template_field.placeholder
    click_on "Update Template field"

    assert_text "Template field was successfully updated"
    click_on "Back"
  end

  test "destroying a Template field" do
    visit template_fields_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Template field was successfully destroyed"
  end
end
