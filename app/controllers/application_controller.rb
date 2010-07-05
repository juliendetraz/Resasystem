class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :set_locale

  helper_method :get_module_name, :get_module_path, :current_devise_user, :devise_user_signed_in?

  def set_locale
    locale = params[:locale] if params[:locale] && I18n.available_locales.member?(params[:locale].to_sym)
    I18n.locale = locale || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def self.default_url_options
    { :locale => I18n.locale }
  end

  def get_module_name
    self.class.name.split("::").first.downcase.to_sym
  end

  def get_module_path(some_path, *param)
    send("#{some_path.gsub('%', self.class.name.split("::").first.downcase).squeeze('_')}_path", *param)
  end

  def current_devise_user
    send("current_#{resource_name.to_s}")
  end

  def devise_user_signed_in?
    send("#{resource_name.to_s}_signed_in?")
  end
end
