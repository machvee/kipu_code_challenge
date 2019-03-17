FactoryBot.define do
  factory :diagnosis do
    coding_system  "1"
    code  {'J%02d' % rand(100)}
    description  "prob"

    factory :asthma do
      description "Asthma"
    end

    factory :inflamation_shoulder do
      description "Inflamation in left shoulder"
    end

    factory :arthritic_knee do
      description "Arthritis left knee"
    end

    factory :broken_arm do
      description "Broken right arm"
    end

    factory :sprained_ankle do
      description "Sprained left ankle"
    end

    factory :abrasions_arm do
      description "Left arm cuts and abrasions"
    end
  end
end
