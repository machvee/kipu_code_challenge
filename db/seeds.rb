# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   name	{{facility.name}}	Show	Edit	Destroy
facility = Facility.create!(name: 'Blue Alps Ski Camp')
facility.template_fields.create!(field_name: 'Name', placeholder: '{{facility.name}}')
facility.template_fields.create!(field_name: 'First Name', placeholder: '{{patient.first_name}}')
facility.template_fields.create!(field_name: 'Middle Name', placeholder: '{{patient.middle_name}}')
facility.template_fields.create!(field_name: 'Last Name', placeholder: '{{patient.last_name}}')
facility.template_fields.create!(field_name: 'Medical Record (MR)', placeholder: '{{patient.mr}}')
facility.template_fields.create!(field_name: 'Summary', placeholder: <<-ENDSUMMARY)
This {{patient.age}} years old {{patient.gender}} was admitted to {{facility.name}} on 
{{patient.admission.date}} at {{patient.admission.time}} due to 
{{patient.admission.diagnoses > described_code | to_sentence}}. The observed symptoms on 
admission were {{patient.admission.symptoms > description | to_sentence}}. 
{{patient.admission.observations > description | to_sentence}}. 
Upon asking about known allergies, the patient disclosed 
{{patient.allergies > description | to_sentence}}. 
Upon asking about chronic conditions, the patient disclosed 
{{patient.chronic_conditions > described_code | to_sentence}}. 
The patient was administered with 
{{patient.medications > name, dosage, route, frequency, “to”, necessity | space_join | to_sentence}}. 
The staff performed 
{{patient.diagnostic_procedures > description, “on”, moment.date, “at”, moment.time | space_join | to_sentence}},
revealing {{patient.diagnoses > described_code | to_sentence}}. 
Our team proceeded to {{patient.treatments > description, “to”, necessity | space_join | to_sentence}}
ENDSUMMARY
