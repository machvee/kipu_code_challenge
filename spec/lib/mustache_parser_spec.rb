require 'rails_helper'

describe MustacheParser do
  let(:facility) { create :current_facility }
  let(:patient) { create :patient }
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

      it "should parse and produce the correct output for a patient method" do
        expect(subject).to eq "My name is #{patient.full_name}"
      end
    end

    context "a model attribute" do
      let(:template) { "My first name is {{patient.first_name}}" }

      it "should parse and produce the correct output for a patient method" do
        expect(subject).to eq "My first name is #{patient.first_name}"
      end
    end

    context "two mustaches in a templates" do
      let(:template) { "My name is {{patient.first_name}} and I'm at {{facility.name}}" }

      it "should parse and produce the correct output for a patient method" do
        expect(subject).to eq "My name is #{patient.first_name} and I'm at #{facility.name}"
      end
    end
  end
end
