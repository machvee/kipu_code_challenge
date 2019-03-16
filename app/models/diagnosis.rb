class Diagnosis < ApplicationRecord
  belongs_to :diagnosable, polymorphic: true

  def described_code
    format("%s (%s)", description, code)
  end
end
