class Member::AdsController < Member::MemberApplicationController
  def index
    @ads = Ad.all
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def new
    @ad = Ad.new
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def create
    @ad = Ad.new(params[:ad])

    if @ad.save
      flash[:notice] = 'Ad was successfully created.'
      redirect_to member_housing_path @ad.housing.id
    else
      render :action => "new"
    end
  end

  def update
    @ad = Ad.find(params[:id])

    if @ad.update_attributes(params[:ad])
      flash[:notice] = 'Ad was successfully updated.'
      redirect_to([get_module_name, @ad])
    else
      render :action => "edit"
    end
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy

    redirect_to(get_module_url("%_ads"))
  end

  # GET
  def search
    respond_to do |format|
      format.html {  }
      format.json {
        @ads = Ad.joins({:housing => [:address, :offer => [:calendar]]}).where(get_search_where_condition)
      }
    end
  end

  def get_search_where_condition
    param_hash = {
      :ad_id => 'id = ?',
      :user_id => 'housings.user_id = ?',
      :city => "housings.addresses.city LIKE ?",
      :location => "(housings.addresses.city LIKE ? OR housings.addresses.state_province_country LIKE ?)",
      :start_date => "housings.offers.calendars.start_date = ?",
      :end_date => "housings.offers.calendars.end_date = ?",
      :housing_type => "housings.housing_type = ?",
#      :room_number => "",
#      :adult_number => "",
#      :child_number => ""
    }
    condition_string = Array.new
    condition_params = Array.new
    param_hash.each_pair {|k,v|
      if params[k]
        condition_string << v
        condition_params << params[k]
      end
    }
    return nil if condition_string.empty?
    condition_params.flatten(1).insert(0, condition_string.join(" AND "))
  end
end
