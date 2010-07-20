# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def locale_switch_tag options
    locale = options[:locale]
    classes = ["langItem"]
    classes << "currentLang" if locale == I18n.locale
    content_tag :li, :class => classes.join(" ") do
      link_to "<span id=\"lang_#{locale}\"><span>".html_safe + t("lang.label_#{locale}") + '</span></span>'.html_safe,
              params.merge(:locale => locale), 
              :id => "switcher#{locale.capitalize}", 
              :title => I18n.t("lang.switch_#{locale}")
    end
  end
  
  def title page_title
    content_for(:title) { page_title + ' - ' }
  end

  def gmap_search_params
    query_string = Array.new
    housing_id = params[:housing_id] || params[:id] if params[:controller].split('/').last == "housings"
    query_string << "housing_id=#{housing_id}" if housing_id
    ad_id = params[:ad_id] || params[:id] if params[:controller].split('/').last == "ads"
    query_string << "ad_id=#{ad_id}" if ad_id
    query_string << "city=#{params[:city]}" if params[:city]
    query_string << "location=#{params[:location]}" if params[:location]
    query_string.join('&')
  end
end
