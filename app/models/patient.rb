class Patient < ApplicationRecord
  enum gender: [:female, :male, :other]

  has_many :alergies, dependent: :destroy
  has_many :medications, foreign_key: :patient_id, class_name: 'MedicationOrder', dependent: :destroy

  has_many :admissions, dependent: :destroy do
    def most_recent
      order(created_at: :asc).last
    end
  end

  has_many :chronic_conditions, as: :diagnosable
  has_many :diagnostic_procedures, dependent: :destroy
  has_many :treatments, dependent: :destroy

  def age
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def admission
    admissions.most_recent
  end
end
