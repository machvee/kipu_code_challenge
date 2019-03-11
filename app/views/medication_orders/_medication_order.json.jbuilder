json.extract! medication_order, :id, :name, :unit, :dosage, :route, :necessity, :patient_id, :created_at, :updated_at
json.url medication_order_url(medication_order, format: :json)
