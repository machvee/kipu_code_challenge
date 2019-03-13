class Facility < ApplicationRecord
  has_many :template_fields, dependent: :destroy
  has_many :admissions, dependent: :destroy
  has_many :patients, through: :admissions
end
