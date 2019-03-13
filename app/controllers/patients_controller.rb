class PatientsController < ApplicationController
  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end
end
