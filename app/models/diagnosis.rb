class Diagnosis < ApplicationRecord
  belongs_to :diagnosable, polymorphic: true
end
