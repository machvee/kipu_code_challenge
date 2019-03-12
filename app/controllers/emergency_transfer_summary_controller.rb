class EmergencyTransferSummaryController < ApplicationController
  before_action :find_patient

  def index
    @admission = @patient.admissions.most_recent
  end

  def find_patient
    @patient = @facility.patients.find(parms[:patient_id])
  end
end
