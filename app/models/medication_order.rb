class MedicationOrder < ApplicationRecord
  belongs_to :patient
  has_one :order_frequency
  enum unit: [:mg]
  enum route: [:po, :im, :sc]

  def frequency
    format("every %d %s", order_frequency.value, order_frequency.unit) if order_frequency.present?
  end
end
