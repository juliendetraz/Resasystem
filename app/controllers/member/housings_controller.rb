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
    if params[:housing][:housing_type] && params[:housing][:housing_type] == 'other'
      params[:housing][:housing_type] = params[:housing][:housing_type_text]
    end

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

    from = params[:housing].delete(:from)
    go_to = params[:housing].delete(:go_to)
    if @housing.update_attributes(params[:housing])
      if go_to
        redirect_to eval(go_to)
      else
        flash[:notice] = 'Housing was successfully updated.'
        redirect_to get_module_path("%_housing", @housing)
      end
    else
      from ? redirect_to(from) : (render :action => "edit")
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

  def add_housing_pois
    @housing = Housing.find params[:id]

    @housing_pois = HousingPoi.find_all_by_housing_id params[:id]
  end

  def search
    respond_to do |format|
      format.html {  }
      format.json {  }
    end
  end
end
