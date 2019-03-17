require 'rails_helper'

feature PatientSearchesController, type: :feature do
  let(:facility) { create :current_facility }
  let(:patient) do
    create :patient, :with_chronic_conditions,
      conditions: [:inflamation_shoulder, :arthritic_knee]
  end
  let!(:admission) do
    create :admission, :with_diagnoses,
      patient: patient,
      facility: facility,
      diagnoses: [:broken_arm, :abrasions_arm]
  end

  before do
    create_templates(facility)
  end

  scenario "user is presented list of patients to select" do

    visit new_patient_search_path

    expect(page).to have_content(patient.full_name)
    expect(page).to have_content(facility.name)
  end

  scenario "user selects patient from list and views summary" do

    visit new_patient_search_path

    select patient.full_name, from: 'patient_id' 

    click_button 'View Emergency Summary'

    expect(page).to have_content(patient.first_name)
    expect(page).to have_content(patient.last_name)

    patient.chronic_conditions.each do |chronic_condition|
      expect(page).to have_content(chronic_condition.described_code)
    end

  end

  def create_templates(facility)
    create(:facility_name, facility: facility)
    create(:patient_first_name, facility: facility)
    create(:patient_middle_name, facility: facility)
    create(:patient_last_name, facility: facility)
    create(:patient_mr, facility: facility)
    create(:admission_summary, facility: facility)
  end
end
