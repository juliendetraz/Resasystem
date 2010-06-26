class Member::ServicesController < Member::MemberApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def edit
    @service = Service.find(params[:id])
  end

  def create
    @service = Service.new(params[:service])

    if @service.save
      flash[:notice] = 'Service was successfully created.'
      redirect_to(@service)
    else
      render :action => "new"
    end
  end

  def update
    @service = Service.find(params[:id])

    if @service.update_attributes(params[:service])
      flash[:notice] = 'Service was successfully updated.'
      redirect_to(@service)
    else
      render :action => "edit"
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    redirect_to services_url
  end
end
