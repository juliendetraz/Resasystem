class Client::HousingPoisController < Client::ClientApplicationController
  # GET /housing_pois
  # GET /housing_pois.xml
  def index
    @housing_pois = HousingPoi.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @housing_pois }
    end
  end

  # GET /housing_pois/1
  # GET /housing_pois/1.xml
  def show
    @housing_poi = HousingPoi.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @housing_poi }
    end
  end

  # GET /housing_pois/new
  # GET /housing_pois/new.xml
  def new
    @housing_poi = HousingPoi.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @housing_poi }
    end
  end

  # GET /housing_pois/1/edit
  def edit
    @housing_poi = HousingPoi.find(params[:id])
  end

  # POST /housing_pois
  # POST /housing_pois.xml
  def create
    @housing_poi = HousingPoi.new(params[:housing_poi])

    respond_to do |format|
      if @housing_poi.save
        flash[:notice] = 'HousingPoi was successfully created.'
        format.html { redirect_to(@housing_poi) }
        format.xml  { render :xml => @housing_poi, :status => :created, :location => @housing_poi }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @housing_poi.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /housing_pois/1
  # PUT /housing_pois/1.xml
  def update
    @housing_poi = HousingPoi.find(params[:id])

    respond_to do |format|
      if @housing_poi.update_attributes(params[:housing_poi])
        flash[:notice] = 'HousingPoi was successfully updated.'
        format.html { redirect_to(@housing_poi) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @housing_poi.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /housing_pois/1
  # DELETE /housing_pois/1.xml
  def destroy
    @housing_poi = HousingPoi.find(params[:id])
    @housing_poi.destroy

    respond_to do |format|
      format.html { redirect_to(housing_pois_url) }
      format.xml  { head :ok }
    end
  end
end
