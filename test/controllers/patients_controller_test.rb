require 'test_helper'

class PatientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patients_url
    assert_response :success
  end
end
