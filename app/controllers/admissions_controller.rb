class AdmissionsController < ApplicationController
  before_action :find_patient

  def index
  end

  def find_patient
    @patient = @facility.patients.find(params[:patient_id])
  end
end
