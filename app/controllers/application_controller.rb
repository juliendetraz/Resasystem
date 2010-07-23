class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :set_locale

  helper_method :get_module_name,
                :get_module_path,
                :get_module_url,
                :current_devise_user,
                :devise_user_signed_in?,
                :is_member?,
                :is_admin?
                

  def get_module_name
    self.class.name.split("::").first.downcase
  end

  def get_module_path(some_path, *param)
    send("#{some_path.gsub('%', self.get_module_name).squeeze('_')}_path", *param)
  end

  def get_module_url(some_url, *param)
    send("#{some_url.gsub('%', self.get_module_name).squeeze('_')}_url", *param)
  end

  def current_devise_user
    send("current_#{resource_name}")
  end

  def devise_user_signed_in?
    send("#{resource_name}_signed_in?")
  end

  # Devise: override helpers to redirect_to namespace_root
  # FIXME quand on est logged dans member et qu'on est dans client le fait d'aller sur la page de login fait entrer ici : pas bon
  def after_sign_in_path_for(resource)
    return get_module_path("%_root") if resource.class.to_s == "Cuser"
    return get_module_path(resource.to_s) if resource.class.to_s == "Symbol"
    get_module_path("%_#{resource.class.to_s.downcase}", resource)
  end

  def after_sign_out_path_for(resource)
    get_module_path("%_root")
  end


protected
  def is_member?
    current_devise_user && current_devise_user.role == "member"
  end

  def is_admin?
    current_devise_user && current_devise_user.role == "admin"
  end


private
  def set_locale
    locale = params[:locale] if params[:locale] && I18n.available_locales.member?(params[:locale].to_sym)
    I18n.locale = locale || session[:locale] || extract_locale_from_accept_language_header || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def self.default_url_options
    { :locale => I18n.locale }
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end 
end
