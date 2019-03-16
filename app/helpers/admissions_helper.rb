module AdmissionsHelper
  def template_field(field_name)
    TemplateField[field_name].substitute_for(@patient)
  end
end
