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
      redirect_to get_module_path("new_%_housing_room", @housing)
    else
      flash[:error] = 'Error will creating housing.'
      render :action => "new"
    end
  end

  def update
    @housing = Housing.find(params[:id])

    if @housing.update_attributes(params[:housing])
      flash[:notice] = 'Housing was successfully updated.'
      redirect_to get_module_path("%_housing", @housing)
    else
      render :action => "edit"
    end
  end

  def destroy
    @housing = Housing.find(params[:id])
    @housing.destroy
    
    redirect_to(get_module_url("%_housings"))
  end
  
  def add_services
    @housing = Housing.find(params[:id])
    
    @assets = Service.find_all_by_service_type 'asset'
    @comforts = Service.find_all_by_service_type 'comfort'
    @activities = Service.find_all_by_service_type 'activity'
  end
end
