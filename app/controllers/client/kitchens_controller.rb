class Client::KitchensController < Client::ClientApplicationController
  # GET /kitchens
  # GET /kitchens.xml
  def index
    @kitchens = Kitchen.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kitchens }
    end
  end

  # GET /kitchens/1
  # GET /kitchens/1.xml
  def show
    @kitchen = Kitchen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kitchen }
    end
  end

  # GET /kitchens/new
  # GET /kitchens/new.xml
  def new
    @kitchen = Kitchen.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kitchen }
    end
  end

  # GET /kitchens/1/edit
  def edit
    @kitchen = Kitchen.find(params[:id])
  end

  # POST /kitchens
  # POST /kitchens.xml
  def create
    @kitchen = Kitchen.new(params[:kitchen])

    respond_to do |format|
      if @kitchen.save
        flash[:notice] = 'Kitchen was successfully created.'
        format.html { redirect_to(@kitchen) }
        format.xml  { render :xml => @kitchen, :status => :created, :location => @kitchen }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kitchen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kitchens/1
  # PUT /kitchens/1.xml
  def update
    @kitchen = Kitchen.find(params[:id])

    respond_to do |format|
      if @kitchen.update_attributes(params[:kitchen])
        flash[:notice] = 'Kitchen was successfully updated.'
        format.html { redirect_to(@kitchen) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kitchen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kitchens/1
  # DELETE /kitchens/1.xml
  def destroy
    @kitchen = Kitchen.find(params[:id])
    @kitchen.destroy

    respond_to do |format|
      format.html { redirect_to(kitchens_url) }
      format.xml  { head :ok }
    end
  end
end
