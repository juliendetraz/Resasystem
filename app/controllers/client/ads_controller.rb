class Client::AdsController < Client::ClientApplicationController
  # GET /ads
  # GET /ads.xml
  def index
    search_condition = get_search_where_condition
    unless search_condition
      @ads = Ad.includes({:housing => [:address, :offers => [:calendar]]})
    else
      @ads = Ad.includes({:housing => [:address, :offers => [:calendar]]}).where(get_search_where_condition)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ads }
    end
  end

  # GET /ads/1
  # GET /ads/1.xml
  def show
    @ad = Ad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ad }
    end
  end

  # GET /ads/new
  # GET /ads/new.xml
  def new
    @ad = Ad.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ad }
    end
  end

  # GET /ads/1/edit
  def edit
    @ad = Ad.find(params[:id])
  end

  # POST /ads
  # POST /ads.xml
  def create
    @ad = Ad.new(params[:ad])

    respond_to do |format|
      if @ad.save
        flash[:notice] = 'Ad was successfully created.'
        format.html { redirect_to([get_module_name, @ad]) }
        format.xml  { render :xml => @ad, :status => :created, :location => @ad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ads/1
  # PUT /ads/1.xml
  def update
    @ad = Ad.find(params[:id])

    respond_to do |format|
      if @ad.update_attributes(params[:ad])
        flash[:notice] = 'Ad was successfully updated.'
        format.html { redirect_to([get_module_name, @ad]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.xml
  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy

    respond_to do |format|
      format.html { redirect_to(client_ads_url) }
      format.xml  { head :ok }
    end
  end

  # GET
  def search
    respond_to do |format|
      format.html {  }
      format.json {
        @ads = Ad.includes({:housing => [:address, :offers => [:calendar]]}).where(get_search_where_condition)
      }
    end
  end

  def get_search_where_condition
    param_hash = {
      :ad_id => '`ads`.id = ?',
      :user_id => '`housings`.`user_id` = ?',
      :city => "`addresses`.`city` LIKE ?",
      :location => "`addresses`.`city` LIKE ? OR `addresses`.`state_province_country` LIKE ?",
      :start_date => "`calendars`.`start_date` = ?",
      :end_date => "`calendars`.`end_date` = ?",
      :housing_type => "`housing`.`housing_type` = ?",
#      :room_number => "",
#      :adult_number => "",
#      :child_number => ""
    }
    condition_string = Array.new
    condition_params = Array.new
    param_hash.each_pair {|k,v|
      if params[k]
        condition_string << v
        condition_params << Array.new(v.count('?'), params[k])
      end
    }
    return nil if condition_string.empty?
    condition_params.flatten(1).insert(0, condition_string.join(" AND "))
  end
end
