FactoryBot.define do
  factory :admission do
    patient
    facility
    moment {Time.now}
  end
end
