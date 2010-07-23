class Client::UsersController < Client::ClientApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = Cuser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = Cuser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = Cuser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = Cuser.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = Cuser.new(params[:cuser])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'Cuser was successfully created.'
        format.html { redirect_to([get_module_name, @user]) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = Cuser.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:cuser])
        flash[:notice] = 'Cuser was successfully updated.'
        format.html { redirect_to([get_module_name, @user]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = Cuser.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(get_module_url("%_cusers")) }
      format.xml  { head :ok }
    end
  end
end
