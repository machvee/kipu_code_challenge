FactoryBot.define do
  factory :template_field do
    facility
    field_name  'field'
    placeholder  '{{field}}'

    factory :facility_name do
      field_name  'name'
      placeholder  '{{facility.name}}'
    end

    factory :patient_first_name do
      field_name  'first_name'
      placeholder "{{patient.first_name}}"
    end

    factory :patient_middle_name do
      field_name  'middle_name'
      placeholder "{{patient.middle_name}}"
    end

    factory :patient_last_name do
      field_name  'last_name'
      placeholder "{{patient.last_name}}"
    end

    factory :patient_mr do
      field_name  'mr'
      placeholder "{{patient.mr}}"
    end

    factory :admission_summary do
      field_name 'summary'
      placeholder  <<-ENDSUMMARY
        This {{patient.age}} years old {{patient.gender}} was admitted to {{facility.name}} on 
        {{patient.admission.moment.date}} at {{patient.admission.moment.time}} due to 
        {{patient.admission.diagnoses > described_code | to_sentence}}. The observed symptoms on 
        admission were {{patient.admission.symptoms > description | to_sentence}}. 
        {{patient.admission.observations > description | to_sentence}}. 
        Upon asking about known allergies, the patient disclosed 
        {{patient.allergies > description | to_sentence}}. 
        Upon asking about chronic conditions, the patient disclosed 
        {{patient.chronic_conditions > described_code | to_sentence}}. 
        The patient was administered with 
        {{patient.medications > name, dosage, route, frequency, "to", necessity | space_join | to_sentence}}. 
        The staff performed 
        {{patient.diagnostic_procedures > description, "on", moment.date, "at", moment.time | space_join | to_sentence}},
        revealing {{patient.diagnoses > described_code | to_sentence}}. 
        Our team proceeded to {{patient.treatments > description, "to", necessity | space_join | to_sentence}}
      ENDSUMMARY
    end
  end
end
