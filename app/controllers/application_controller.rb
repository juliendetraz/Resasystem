# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :set_locale

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation

  helper_method :current_user
  
  def set_locale
    locale = params[:locale] if params[:locale] && I18n.available_locales.member?(params[:locale].to_sym)
    I18n.locale = locale || session[:locale] || 'fr'
    session[:locale] = I18n.locale
  end
  
private
  def current_user
#    TODO: cette ligne est là pour continuer le dev'
#    le temps que devise fonctionne avec les namespaces
    @current_user = User.find 1
  end

end
