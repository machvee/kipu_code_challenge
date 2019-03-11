class Admission < ApplicationRecord
  belongs_to :facility
  belongs_to :patient

  has_many :diagnoses
  has_many :symptoms
  has_many :observations
end
