class Member::DinningroomsController < Member::MemberApplicationController
  # GET /dinningrooms
  # GET /dinningrooms.xml
  def index
    @dinningrooms = Dinningroom.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dinningrooms }
    end
  end

  # GET /dinningrooms/1
  # GET /dinningrooms/1.xml
  def show
    @dinningroom = Dinningroom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dinningroom }
    end
  end

  # GET /dinningrooms/new
  # GET /dinningrooms/new.xml
  def new
    @dinningroom = Dinningroom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dinningroom }
    end
  end

  # GET /dinningrooms/1/edit
  def edit
    @dinningroom = Dinningroom.find(params[:id])
  end

  # POST /dinningrooms
  # POST /dinningrooms.xml
  def create
    @dinningroom = Dinningroom.new(params[:dinningroom])

    respond_to do |format|
      if @dinningroom.save
        flash[:notice] = 'Dinningroom was successfully created.'
        format.html { redirect_to(@dinningroom) }
        format.xml  { render :xml => @dinningroom, :status => :created, :location => @dinningroom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dinningroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dinningrooms/1
  # PUT /dinningrooms/1.xml
  def update
    @dinningroom = Dinningroom.find(params[:id])

    respond_to do |format|
      if @dinningroom.update_attributes(params[:dinningroom])
        flash[:notice] = 'Dinningroom was successfully updated.'
        format.html { redirect_to(@dinningroom) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dinningroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dinningrooms/1
  # DELETE /dinningrooms/1.xml
  def destroy
    @dinningroom = Dinningroom.find(params[:id])
    @dinningroom.destroy

    respond_to do |format|
      format.html { redirect_to(dinningrooms_url) }
      format.xml  { head :ok }
    end
  end
end
