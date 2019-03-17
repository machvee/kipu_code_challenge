FactoryBot.define do
  factory :admission do
    patient
    facility
    moment {Time.now}

    trait :with_diagnoses do
      transient do
        diagnoses []
      end

      after(:create) do |admission, evaluator|
        evaluator.diagnoses.each do |diagnosis|
          create(diagnosis, diagnosable: admission)
        end
      end
    end
  end
end
