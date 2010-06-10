class Admin::BedroomsController < Admin::AdminApplicationController
  # GET /bedrooms
  # GET /bedrooms.xml
  def index
    @bedrooms = Bedroom.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bedrooms }
    end
  end

  # GET /bedrooms/1
  # GET /bedrooms/1.xml
  def show
    @bedroom = Bedroom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bedroom }
    end
  end

  # GET /bedrooms/new
  # GET /bedrooms/new.xml
  def new
    @bedroom = Bedroom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bedroom }
    end
  end

  # GET /bedrooms/1/edit
  def edit
    @bedroom = Bedroom.find(params[:id])
  end

  # POST /bedrooms
  # POST /bedrooms.xml
  def create
    @bedroom = Bedroom.new(params[:bedroom])

    respond_to do |format|
      if @bedroom.save
        flash[:notice] = 'Bedroom was successfully created.'
        format.html { redirect_to(@bedroom) }
        format.xml  { render :xml => @bedroom, :status => :created, :location => @bedroom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bedroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bedrooms/1
  # PUT /bedrooms/1.xml
  def update
    @bedroom = Bedroom.find(params[:id])

    respond_to do |format|
      if @bedroom.update_attributes(params[:bedroom])
        flash[:notice] = 'Bedroom was successfully updated.'
        format.html { redirect_to(@bedroom) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bedroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bedrooms/1
  # DELETE /bedrooms/1.xml
  def destroy
    @bedroom = Bedroom.find(params[:id])
    @bedroom.destroy

    respond_to do |format|
      format.html { redirect_to(bedrooms_url) }
      format.xml  { head :ok }
    end
  end
end
