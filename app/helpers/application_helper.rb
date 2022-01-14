module ApplicationHelper
  def class_for_link_to(x_path)
    # For _navbar.html.erb
    "navbar_link_to #{'navbar_link_to_active' if current_page?(x_path)}"
  end

  def responsive_html_for_navbar(emoji, texte)
    "<span>#{emoji}</span><span class='hidden lg:inline-block'>&nbsp;  #{texte}</span>".html_safe
  end

  # def defined?(instance, attribute)
  #   !instance.attribute.nil?
  # end
end
