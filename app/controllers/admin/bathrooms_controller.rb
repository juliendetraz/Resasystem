class Admin::BathroomsController < Admin::AdminApplicationController
  # GET /bathrooms
  # GET /bathrooms.xml
  def index
    @bathrooms = Bathroom.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bathrooms }
    end
  end

  # GET /bathrooms/1
  # GET /bathrooms/1.xml
  def show
    @bathroom = Bathroom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bathroom }
    end
  end

  # GET /bathrooms/new
  # GET /bathrooms/new.xml
  def new
    @bathroom = Bathroom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bathroom }
    end
  end

  # GET /bathrooms/1/edit
  def edit
    @bathroom = Bathroom.find(params[:id])
  end

  # POST /bathrooms
  # POST /bathrooms.xml
  def create
    @bathroom = Bathroom.new(params[:bathroom])

    respond_to do |format|
      if @bathroom.save
        flash[:notice] = 'Bathroom was successfully created.'
        format.html { redirect_to(@bathroom) }
        format.xml  { render :xml => @bathroom, :status => :created, :location => @bathroom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bathroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bathrooms/1
  # PUT /bathrooms/1.xml
  def update
    @bathroom = Bathroom.find(params[:id])

    respond_to do |format|
      if @bathroom.update_attributes(params[:bathroom])
        flash[:notice] = 'Bathroom was successfully updated.'
        format.html { redirect_to(@bathroom) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bathroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bathrooms/1
  # DELETE /bathrooms/1.xml
  def destroy
    @bathroom = Bathroom.find(params[:id])
    @bathroom.destroy

    respond_to do |format|
      format.html { redirect_to(bathrooms_url) }
      format.xml  { head :ok }
    end
  end
end
