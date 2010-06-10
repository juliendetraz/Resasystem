class Member::HousingServicesController < Member::MemberApplicationController
  # GET /housing_services
  # GET /housing_services.xml
  def index
    @housing_services = HousingService.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @housing_services }
    end
  end

  # GET /housing_services/1
  # GET /housing_services/1.xml
  def show
    @housing_service = HousingService.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @housing_service }
    end
  end

  # GET /housing_services/new
  # GET /housing_services/new.xml
  def new
    @housing_service = HousingService.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @housing_service }
    end
  end

  # GET /housing_services/1/edit
  def edit
    @housing_service = HousingService.find(params[:id])
  end

  # POST /housing_services
  # POST /housing_services.xml
  def create
    @housing_service = HousingService.new(params[:housing_service])

    respond_to do |format|
      if @housing_service.save
        flash[:notice] = 'HousingService was successfully created.'
        format.html { redirect_to(@housing_service) }
        format.xml  { render :xml => @housing_service, :status => :created, :location => @housing_service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @housing_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /housing_services/1
  # PUT /housing_services/1.xml
  def update
    @housing_service = HousingService.find(params[:id])

    respond_to do |format|
      if @housing_service.update_attributes(params[:housing_service])
        flash[:notice] = 'HousingService was successfully updated.'
        format.html { redirect_to(@housing_service) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @housing_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /housing_services/1
  # DELETE /housing_services/1.xml
  def destroy
    @housing_service = HousingService.find(params[:id])
    @housing_service.destroy

    respond_to do |format|
      format.html { redirect_to(housing_services_url) }
      format.xml  { head :ok }
    end
  end
end
