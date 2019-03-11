class MedicationOrder < ApplicationRecord
  belongs_to :patient
  enum unit: [:mg]
  enum route: [:po, :im, :sc]
end
