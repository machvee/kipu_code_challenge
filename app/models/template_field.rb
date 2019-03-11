class TemplateField < ApplicationRecord
  belongs_to :facility

  def label
    field_name.titleize
  end
end
