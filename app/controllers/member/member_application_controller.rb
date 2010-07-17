# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class Member::MemberApplicationController < ApplicationController
  layout 'member/application'
  helper :all
  helper_method :resource_name,
                :rooms_count,
                :housings_count

  def rooms_count
    Room.all(:conditions => ["housings.user_id = ?", current_devise_user], :joins => :housing).count
  end

  def housings_count
    Housing.find_all_by_user_id(current_devise_user).count
  end


private
  def resource_name
    :"#{get_module_name}_muser"
  end
end
