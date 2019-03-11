class Facility < ApplicationRecord
  has_many :template_fields
  has_many :admissions
  has_many :patients, through: :admissions
end
