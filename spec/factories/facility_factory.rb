FactoryBot.define do
  factory :facility do
    name 'facility_1'

    factory :current_facility do
      name CURRENT_FACILITY_NAME
    end
  end
end
