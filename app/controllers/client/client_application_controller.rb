# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class Client::ClientApplicationController < ApplicationController
  layout 'client/application'
  helper :all
end
