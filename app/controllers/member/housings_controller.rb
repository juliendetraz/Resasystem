class Member::HousingsController < Member::MemberApplicationController
  def index
    @housings = Housing.all
  end

  def show
    @housing = Housing.find(params[:id])
  end

  def new
    @housing = Housing.new
  end

  def edit
    @housing = Housing.find(params[:id])
  end

  def create
    @housing = Housing.new(params[:housing])
    if @housing.save
      flash[:notice] = 'Housing was successfully created.'
      redirect_to(@housing)
    else
      render :action => "new"
    end
  end

  def update
    @housing = Housing.find(params[:id])

    if @housing.update_attributes(params[:housing])
      flash[:notice] = 'Housing was successfully updated.'
      redirect_to(@housing)
    else
      render :action => "edit"
    end
  end

  def destroy
    @housing = Housing.find(params[:id])
    @housing.destroy
    
    redirect_to(housings_url)
  end
end
