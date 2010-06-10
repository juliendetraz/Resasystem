class Admin::MessageUsergroupsController < Admin::AdminApplicationController
  # GET /message_usergroups
  # GET /message_usergroups.xml
  def index
    @message_usergroups = MessageUsergroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @message_usergroups }
    end
  end

  # GET /message_usergroups/1
  # GET /message_usergroups/1.xml
  def show
    @message_usergroup = MessageUsergroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message_usergroup }
    end
  end

  # GET /message_usergroups/new
  # GET /message_usergroups/new.xml
  def new
    @message_usergroup = MessageUsergroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message_usergroup }
    end
  end

  # GET /message_usergroups/1/edit
  def edit
    @message_usergroup = MessageUsergroup.find(params[:id])
  end

  # POST /message_usergroups
  # POST /message_usergroups.xml
  def create
    @message_usergroup = MessageUsergroup.new(params[:message_usergroup])

    respond_to do |format|
      if @message_usergroup.save
        flash[:notice] = 'MessageUsergroup was successfully created.'
        format.html { redirect_to(@message_usergroup) }
        format.xml  { render :xml => @message_usergroup, :status => :created, :location => @message_usergroup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message_usergroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /message_usergroups/1
  # PUT /message_usergroups/1.xml
  def update
    @message_usergroup = MessageUsergroup.find(params[:id])

    respond_to do |format|
      if @message_usergroup.update_attributes(params[:message_usergroup])
        flash[:notice] = 'MessageUsergroup was successfully updated.'
        format.html { redirect_to(@message_usergroup) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message_usergroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /message_usergroups/1
  # DELETE /message_usergroups/1.xml
  def destroy
    @message_usergroup = MessageUsergroup.find(params[:id])
    @message_usergroup.destroy

    respond_to do |format|
      format.html { redirect_to(message_usergroups_url) }
      format.xml  { head :ok }
    end
  end
end
