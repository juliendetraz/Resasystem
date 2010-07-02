class Client::Devise::SessionsController < Devise::SessionsController
#  helper :all
#
#  before_filter :set_locale
#
#  def set_locale
#    locale = params[:locale] if params[:locale] && I18n.available_locales.member?(params[:locale].to_sym)
#    I18n.locale = locale || session[:locale] || I18n.default_locale
#    session[:locale] = I18n.locale
#  end
end