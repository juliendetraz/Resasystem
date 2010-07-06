# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class Admin::AdminApplicationController < ApplicationController
  layout 'admin/application'
  helper :all
  helper_method :resource_name

private
  def resource_name
    :"#{get_module_name}_user"
  end
end
