class PatientSearchesController < ApplicationController
  
  before_action :get_patient, only: [:create]

  def new
    @patients = Patient.all
  end

  def create
    redirect_to admissions_url(@patient)
  end

  private

  def get_patient
    @patient = Patient.find(params[:patient_id])
  end
end
