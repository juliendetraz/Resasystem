class Admin::UsersController < Admin::AdminApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = Auser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = Auser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = Auser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = Auser.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = Auser.new(params[:auser])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'Auser was successfully created.'
        format.html { redirect_to(@user) }
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
    @user = Auser.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:auser])
        flash[:notice] = 'Auser was successfully updated.'
        format.html { redirect_to(@user) }
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
    @user = Auser.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(get_module_url("%_ausers")) }
      format.xml  { head :ok }
    end
  end
end
