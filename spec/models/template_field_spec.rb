require 'rails_helper'

describe TemplateField, type: :model do
  let(:facility) { create :current_facility }
  let!(:facility_name_template) { create :facility_name, facility: facility }
  let!(:patient_last_name_template) { create :patient_last_name, facility: facility }

  context ".[]" do
    let(:field_name) { :last_name }
    subject {described_class[field_name]}

    it "should return the expected template when passed a field name" do
      expect(subject).to eq(patient_last_name_template)
    end
  end

  context "#substitute_for" do
    let(:patient) { create :patient }

    subject {patient_last_name_template.substitute_for(patient)}

    it "should return the expected substitution after parsing placeholder" do
      expect(subject).to eq(patient.last_name)
    end
  end
end
