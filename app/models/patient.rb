class Patient < ApplicationRecord
  enum gender: [:female, :male, :other]

  has_many :allergies
  has_many :chronic_conditions
  has_many :allergies
  has_many :medications, foreign_key: :patient_id, class_name: 'MedicationOrder'

  has_many :admissions do 
    def most_recent
      order(created_at: :asc).last
    end
  end

  delegate :diagnoses, to: :admission
  has_many :diagnostic_procedures
  has_many :treatments

  def age
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
