class Member::UsersController < Member::MemberApplicationController
  def index
    @users = Muser.all
  end

  def show
    @user = Muser.find(params[:id])
  end
  
  def new
    @user = Muser.new
  end

  def edit
    @user = Muser.find(params[:id])
  end

  def create
    @user = Muser.new(params[:muser])

    if @user.save
      flash[:notice] = 'Muser was successfully created.'
      redirect_to(@user)
    else
      render :action => "new"
    end
  end

  def update
    @user = Muser.find(params[:id])

    if @user.update_attributes(params[:muser])
      flash[:notice] = 'Muser was successfully updated.'
      redirect_to(@user)
    else
      render :action => "edit"
    end
  end

  def destroy
    @user = Muser.find(params[:id])
    @user.destroy

    redirect_to(get_module_url("%_musers"))
  end
end
