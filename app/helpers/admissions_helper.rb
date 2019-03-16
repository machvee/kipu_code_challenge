module AdmissionsHelper
  def template_field(field_name)
    t = TemplateField[field_name]
    if t.present?
      content_tag(:div, t.substitute_for(@patient), class: "text-primary")
    else
      content_tag(:div, "unknown template field #{field_name}", class: "text-danger")
    end
  end
end
