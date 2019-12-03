module ApplicationHelper
  ALERT_TYPES = [:danger, :info, :success, :warning] unless const_defined?(:ALERT_TYPES)

  def fa(icon)
    glyphicon = "fa-#{icon.to_s}"
    "<i class='fa #{glyphicon}'></i>".html_safe
  end

  def glyph(icon)
    glyphicon = "glyphicon-#{icon.to_s}"
    "<span class='glyphicon #{glyphicon}'></span>".html_safe
  end

  def display_flash_messages
    render "/layouts/messages"
  end

  def sortable(column, title = nil, params)
    params_copy = params.dup
    params_copy.delete(:sort)
    params_copy.delete(:direction)

    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"

    icon = "chevron-up"
    if direction == "desc"
      icon = "chevron-down"
    end
    icon_span = glyph(icon)
    css_class = column == sort_column ? "current #{sort_direction}" : nil

    link_string = title
    if column == sort_column
      link_string = icon_span + "<span style='margin-left: 5px;'>#{title}</span>".html_safe
    end

    link_to link_string, {params: params_copy.to_unsafe_h, sort: column, direction: direction}, {:class => css_class}
  end

  def bootstrap_class_for(flash_type)
    case flash_type
    when "success"
      "alert-success"
    when "error"
      "alert-danger"
    when "alert"
      "alert-warning"
    when "notice"
      "alert-info"
    else
      flash_type.to_s
    end
  end

  def ldate(dt, format = :long)
    dt ? l(dt, format: format) : ""
  end

  def error_message(resource)
    return '' if resource.errors.blank? || resource.errors.messages.blank?

    non_base_errors = {}
    resource.errors.messages.each do |key,value|
      key_pieces = key.to_s.split(".")
      if key_pieces.length == 1 && key != :base
        non_base_errors[key] = value
      end
    end

    return '' if non_base_errors.blank?

    html = <<-HTML
      <div class="alert alert-danger fade in">
        <button class="close" aria-hidden="true" data-dismiss="alert" type="button">&#215;</button>
        Existem erros que precisam ser corrigidos. Verifique os campos em vermelho.
      </div>
    HTML

    html.html_safe
  end

  def display_nested_errors(resource)
    return '' if (resource.errors.empty?) or (resource.errors.messages.empty?)

    errors = {}
    resource.errors.messages.each do |key,value|
      key_pieces = key.to_s.split(".")
      if key == :base || (key_pieces.length > 1 && key_pieces[1] == "base")
        errors[key] = value
      end
    end

    return '' if errors.blank?
    messages = errors.map { |key,msg| content_tag(:p, msg[0]) if !msg[0].blank?  }.join
    html = <<-HTML
    <div class="alert alert-danger fade in">
      <button class="close" aria-hidden="true" data-dismiss="alert" type="button">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def tooltip_error_title(resource, attribute)
    resource.errors.include?(attribute) ? resource.errors[attribute].join(', ').html_safe : ''
  end

  def login_label(user)
    name_parts = user.nome.split(" ")
    label = name_parts.first
    label += " #{name_parts.last}" if name_parts.length > 1
    label
  end

  def checked
    "<div style='color: green;'>#{fa(:"check")}</div>".html_safe
  end

  def unchecked
    "<div style='color: red;'>#{fa(:"remove")}</div>".html_safe
  end
end
