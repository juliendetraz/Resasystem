class Member::DinningroomsController < Member::MemberApplicationController
  def index
    @dinningrooms = Dinningroom.all
  end

  def show
    @dinningroom = Dinningroom.find(params[:id])
  end

  def new
    @dinningroom = Dinningroom.new
  end

  def edit
    @dinningroom = Dinningroom.find(params[:id])
  end

  def create
    @dinningroom = Dinningroom.new(params[:dinningroom])

    respond_to do |format|
      if @dinningroom.save
        format.html { redirect_to(@dinningroom) }
        format.js   { @dinningroom }
      else
        format.html { render :action => "new" }
        format.js   { }
      end
    end
  end

  def update
    @dinningroom = Dinningroom.find(params[:id])

    respond_to do |format|
      if @dinningroom.update_attributes(params[:dinningroom])
        flash[:notice] = 'Dinningroom was successfully updated.'
        format.html { redirect_to(@dinningroom) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @dinningroom = Dinningroom.find(params[:id])
    @dinningroom.destroy

    respond_to do |format|
      format.html { redirect_to(dinningrooms_url) }
      format.js   { }
    end
  end
end
