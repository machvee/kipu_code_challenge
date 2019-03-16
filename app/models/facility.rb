class Facility < ApplicationRecord
  has_many :template_fields, dependent: :destroy
  has_many :admissions, dependent: :destroy
  has_many :patients, through: :admissions

  def self.current
    find_by name: CURRENT_FACILITY_NAME
  end
end
