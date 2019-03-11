require 'test_helper'

class TreatmentModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treatment_model = treatment_models(:one)
  end

  test "should get index" do
    get treatment_models_url
    assert_response :success
  end

  test "should get new" do
    get new_treatment_model_url
    assert_response :success
  end

  test "should create treatment_model" do
    assert_difference('TreatmentModel.count') do
      post treatment_models_url, params: { treatment_model: { description: @treatment_model.description, necessity: @treatment_model.necessity, patient_id: @treatment_model.patient_id } }
    end

    assert_redirected_to treatment_model_url(TreatmentModel.last)
  end

  test "should show treatment_model" do
    get treatment_model_url(@treatment_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_treatment_model_url(@treatment_model)
    assert_response :success
  end

  test "should update treatment_model" do
    patch treatment_model_url(@treatment_model), params: { treatment_model: { description: @treatment_model.description, necessity: @treatment_model.necessity, patient_id: @treatment_model.patient_id } }
    assert_redirected_to treatment_model_url(@treatment_model)
  end

  test "should destroy treatment_model" do
    assert_difference('TreatmentModel.count', -1) do
      delete treatment_model_url(@treatment_model)
    end

    assert_redirected_to treatment_models_url
  end
end
