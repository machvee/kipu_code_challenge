FactoryBot.define do
  factory :patient do
    first_name 'Dave'
    last_name 'Machvee'
    middle_name 'J'
    dob '1981-03-19 12:00:00'
    mr '18347634348'

    trait :with_chronic_conditions do
      transient do
        conditions []
      end

      after(:create) do |patient, evaluator|
        evaluator.conditions.each do |condition|
          create(condition, diagnosable: patient)
        end
      end
    end
  end
end
