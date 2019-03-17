class PatientSearchesController < ApplicationController
  
  before_action :valid_patient_id, only: [:create]
  before_action :get_patient, only: [:create]

  def new
    @patients = Patient.all
  end

  def create
    redirect_to patient_admissions_url(@patient)
  end

  private

  def valid_patient_id
    redirect_to(
      new_patient_search_path,
      flash: {danger: "You must select a patient"}
    ) if params[:patient_id].blank?
  end

  def get_patient
    @patient = Patient.find(params[:patient_id])
  end
end
