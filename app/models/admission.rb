class Admission < ApplicationRecord
  belongs_to :facility
  belongs_to :patient

  has_many :diagnoses, as: :diagnosable, dependent: :destroy
  has_many :symptoms, dependent: :destroy
  has_many :observations, dependent: :destroy
end
