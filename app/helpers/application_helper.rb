# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def locale_switch_tag options
    locale = options[:locale]
    classes = ["langItem"]
    classes << "currentLang" if locale == I18n.locale
    content_tag :li, :class => classes.join(" ") do
      link_to "<span id=\"lang_#{locale}\"><span>" + t("lang.label_#{locale}") + '</span></span>', 
              params.merge(:locale => locale), 
              :id => "switcher#{locale.capitalize}", 
              :title => I18n.t("lang.switch_#{locale}")
    end
  end
  
  def title page_title
    content_for(:title) { page_title + ' - ' }
  end

end
