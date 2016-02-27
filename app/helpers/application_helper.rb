module ApplicationHelper
  def status_tag(boolean, options = {})
    options[:true_text] ||= '<i class="fa fa-check"></i>'.html_safe
    options[:false_text] ||= '<i class="fa fa-times"></i>'.html_safe

    if boolean
      content_tag(:span, options[:true_text],
                  class: 'status true', style: 'color: green')
    else
      content_tag(:span, options[:false_text],
                  class: 'status false', style: 'color: red')
    end
  end

  def error_messages_for(object)
    render(partial: 'application/error_messages', locals: {object: object})
  end
end
