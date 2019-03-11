json.extract! observation, :id, :moment, :description, :admission_id, :created_at, :updated_at
json.url observation_url(observation, format: :json)
