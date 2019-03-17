require 'rails_helper'

describe MustacheParser do
  let(:facility) { create :current_facility }
  let(:patient) do
    create :patient, :with_chronic_conditions,
      conditions: [:inflamation_shoulder, :arthritic_knee]
  end
  let(:admission) do
    create :admission, :with_diagnoses,
      patient: patient,
      facility: facility,
      diagnoses: [:broken_arm, :abrasions_arm]
  end

  let(:context) do
    {
      patient: patient,
      facility: facility
    }
  end
  let(:parser) { described_class.new(context) }

  subject { parser.parse(template) }

  context "#parse" do

    context "a model method" do
      let(:template) { "My name is {{patient.full_name}}" }

      it "should parse and produce the correct output" do
        expect(subject).to eq "My name is #{patient.full_name}"
      end
    end

    context "a model attribute" do
      let(:template) { "My first name is {{patient.first_name}}" }

      it "should parse and produce the correct output" do
        expect(subject).to eq "My first name is #{patient.first_name}"
      end
    end

    context "two mustaches in a templates" do
      let(:template) { "My name is {{patient.first_name}} and I'm at {{facility.name}}" }

      it "should parse and produce the correct output" do
        expect(subject).to eq "My name is #{patient.first_name} and I'm at #{facility.name}"
      end
    end

    context "a collection with attrs and a function" do
      let(:template) { "Patient had {{patient.chronic_conditions > described_code | to_sentence }}" }

      it "should parse and produce the correct output" do
        expect(subject).to eq "Patient had #{patient.chronic_conditions.first.described_code} " +
          "and #{patient.chronic_conditions.last.described_code}"
      end
    end
  end
end
