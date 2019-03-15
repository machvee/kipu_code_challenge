class TemplateField < ApplicationRecord
  belongs_to :facility

  def label
    field_name.titleize
  end
  
  def self.[](name)
    facility.template_fields.find_by(name: name)
  end

  def title
    name.titleize
  end

  MUSTACHE_RE = /{{([^}]*)}}/
  FIELD_SPEC_RE = /([^\.]+)\.([^\.]+)/

  def parse(patient)
    context = {
      facility: facility,
      patient: patient
    }
    m = matches(placeholder, MUSTACHE_RE)
    m.each do |match|
      str = fields_spec_parse(m[1], context)
    end
  end

  private

  def fields_spec_parse(e, context)

  end

  def matches(s, re)
    start_at = 0
    [].tap do |matches|
      while(m = s.match(re, start_at))
        matches.push(m)
        start_at = m.end(0)
      end
    end
  end
end
