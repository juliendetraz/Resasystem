class Client::LivingroomsController < Client::ClientApplicationController
  # GET /livingrooms
  # GET /livingrooms.xml
  def index
    @livingrooms = Livingroom.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @livingrooms }
    end
  end

  # GET /livingrooms/1
  # GET /livingrooms/1.xml
  def show
    @livingroom = Livingroom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @livingroom }
    end
  end

  # GET /livingrooms/new
  # GET /livingrooms/new.xml
  def new
    @livingroom = Livingroom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @livingroom }
    end
  end

  # GET /livingrooms/1/edit
  def edit
    @livingroom = Livingroom.find(params[:id])
  end

  # POST /livingrooms
  # POST /livingrooms.xml
  def create
    @livingroom = Livingroom.new(params[:livingroom])

    respond_to do |format|
      if @livingroom.save
        flash[:notice] = 'Livingroom was successfully created.'
        format.html { redirect_to(@livingroom) }
        format.xml  { render :xml => @livingroom, :status => :created, :location => @livingroom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @livingroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /livingrooms/1
  # PUT /livingrooms/1.xml
  def update
    @livingroom = Livingroom.find(params[:id])

    respond_to do |format|
      if @livingroom.update_attributes(params[:livingroom])
        flash[:notice] = 'Livingroom was successfully updated.'
        format.html { redirect_to(@livingroom) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @livingroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /livingrooms/1
  # DELETE /livingrooms/1.xml
  def destroy
    @livingroom = Livingroom.find(params[:id])
    @livingroom.destroy

    respond_to do |format|
      format.html { redirect_to(livingrooms_url) }
      format.xml  { head :ok }
    end
  end
end
