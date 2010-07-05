# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class Client::ClientApplicationController < ApplicationController
  layout 'client/application'
  helper :all
  helper_method :resource_name

private
  #sometimes devise's resource_name is not available
  def resource_name
    :client_cuser
  end
end
