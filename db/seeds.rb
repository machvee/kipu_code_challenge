# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
facility = Facility.create!(name: CURRENT_FACILITY_NAME)
facility.template_fields.create!(field_name: 'name', placeholder: '{{facility.name}}')
facility.template_fields.create!(field_name: 'first_name', placeholder: '{{patient.first_name}}')
facility.template_fields.create!(field_name: 'middle_name', placeholder: '{{patient.middle_name}}')
facility.template_fields.create!(field_name: 'last_name', placeholder: '{{patient.last_name}}')
facility.template_fields.create!(field_name: 'medical_record_(mr)', placeholder: '{{patient.mr}}')
facility.template_fields.create!(field_name: 'summary', placeholder: <<-ENDSUMMARY)
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

joe = Patient.create!(
  first_name: 'Joe',
  last_name: 'Smith',
  middle_name: 'W.',
  dob: '1993-08-17 12:00:00',
  mr: '873476832434',
  gender: :male
)
date_of_admission = 3.days.ago

admission = facility.admissions.create!(
  moment: date_of_admission,
  patient: joe
)

diagnosis = admission.diagnoses.create!(
  coding_system: 'AA',
  code: '17R',
  description: 'Sprained Knee (L)'
)

symptoms = admission.symptoms.create!(
  [
    {description: 'Knee (L) pain'},
    {description: 'Knee (L) swollen'}
  ]
)

observation =  admission.observations.create!(
  moment: date_of_admission + 40.minutes,
  description: 'Knee (L) swelling reduced'
)

allergies = joe.allergies.create!(
  [
    { description: 'ceftin' },
    { description: 'prolox' }
  ]
)

medication1 = joe.medications.create!(
  name: 'Warfarin',
  unit: :mg,
  dosage: 0.25,
  route: :po,
  necessity: 'depression'
)

chronic_condition = joe.chronic_conditions.create!(
  coding_system: 'AA',
  code: '87G',
  description: 'Arthritic Knee'
)

diagnostic_procedure = joe.diagnostic_procedures.create!(
  moment: date_of_admission + 20.minutes,
  description: 'Knee (L) X-Ray'
)

treatment = joe.treatments.create!(
   description: 'ice bag on Knee (L)',
   necessity: 'reduce swelling'
)
