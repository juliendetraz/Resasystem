class Member::AdsController < Member::MemberApplicationController
  def index
    @ads = Ad.all
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def new
    @ad = Ad.new
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def create
    @ad = Ad.new(params[:ad])

    if @ad.save
      flash[:notice] = 'Ad was successfully created.'
      redirect_to member_housing_path @ad.housing.id
    else
      render :action => "new"
    end
  end

  def update
    @ad = Ad.find(params[:id])

    if @ad.update_attributes(params[:ad])
      flash[:notice] = 'Ad was successfully updated.'
      redirect_to([get_module_name, @ad])
    else
      render :action => "edit"
    end
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy

    redirect_to(get_module_url("%_ads"))
  end
end
