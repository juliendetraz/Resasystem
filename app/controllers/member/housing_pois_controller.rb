class Member::HousingPoisController < Member::MemberApplicationController
  def index
    @housing_pois = HousingPoi.all
  end

  def show
    @housing_poi = HousingPoi.find(params[:id])
  end

  def new
    @housing_poi = HousingPoi.new
  end

  def edit
    @housing_poi = HousingPoi.find(params[:id])
  end

  def create
    @housing_poi = HousingPoi.new(params[:housing_poi])

    respond_to do |format|
      if @housing_poi.save
        format.html { redirect_to(@housing_poi) }
        format.js   { @housing_poi }
      else
        format.html { render :action => "new" }
        format.js   { }
      end
    end
  end

  def update
    @housing_poi = HousingPoi.find(params[:id])

    respond_to do |format|
      if @housing_poi.update_attributes(params[:housing_poi])
        flash[:notice] = 'HousingPoi was successfully updated.'
        format.html { redirect_to(@housing_poi) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @housing_poi = HousingPoi.find(params[:id])
    @housing_poi.destroy

    respond_to do |format|
      format.html { redirect_to(housing_pois_url) }
      format.js   {
        @housing_pois = HousingPoi.find_all_by_housing_id @housing_poi.housing_id
      }
    end
  end
end
