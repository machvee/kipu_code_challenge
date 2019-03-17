module AdmissionsHelper
  def template_field(field_name, header: nil, col: 'col')
    t = TemplateField[field_name]
    if t.present?
      hdr = header.nil? ? field_name.titleize : header
      content_tag(:div, class: [col, "border"]) do
        concat content_tag(:div, hdr, class: "h6")
        concat content_tag(:div, t.substitute_for(@patient), class: "text-primary")
      end
    else
      content_tag(:div, "unknown template field #{field_name}", class: "text-danger")
    end
  end
end
