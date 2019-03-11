require 'test_helper'

class DiagnosticProceduresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diagnostic_procedure = diagnostic_procedures(:one)
  end

  test "should get index" do
    get diagnostic_procedures_url
    assert_response :success
  end

  test "should get new" do
    get new_diagnostic_procedure_url
    assert_response :success
  end

  test "should create diagnostic_procedure" do
    assert_difference('DiagnosticProcedure.count') do
      post diagnostic_procedures_url, params: { diagnostic_procedure: { description: @diagnostic_procedure.description, moment: @diagnostic_procedure.moment, patient_id: @diagnostic_procedure.patient_id } }
    end

    assert_redirected_to diagnostic_procedure_url(DiagnosticProcedure.last)
  end

  test "should show diagnostic_procedure" do
    get diagnostic_procedure_url(@diagnostic_procedure)
    assert_response :success
  end

  test "should get edit" do
    get edit_diagnostic_procedure_url(@diagnostic_procedure)
    assert_response :success
  end

  test "should update diagnostic_procedure" do
    patch diagnostic_procedure_url(@diagnostic_procedure), params: { diagnostic_procedure: { description: @diagnostic_procedure.description, moment: @diagnostic_procedure.moment, patient_id: @diagnostic_procedure.patient_id } }
    assert_redirected_to diagnostic_procedure_url(@diagnostic_procedure)
  end

  test "should destroy diagnostic_procedure" do
    assert_difference('DiagnosticProcedure.count', -1) do
      delete diagnostic_procedure_url(@diagnostic_procedure)
    end

    assert_redirected_to diagnostic_procedures_url
  end
end
