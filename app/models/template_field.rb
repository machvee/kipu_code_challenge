class TemplateField < ApplicationRecord
  belongs_to :facility

  def label
    field_name.titleize
  end
  
  def self.[](field_name)
    Facility.current.template_fields.find_by(field_name: field_name)
  end

  def substitute_for(patient)
    context = {
      facility: facility,
      patient: patient
    }
    parser = MustacheParser.new(context)
    parser.parse(placeholder)
  end
end
