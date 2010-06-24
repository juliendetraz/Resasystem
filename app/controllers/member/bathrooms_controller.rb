class Member::BathroomsController < Member::MemberApplicationController
  def index
    @bathrooms = Bathroom.all
  end

  def show
    @bathroom = Bathroom.find(params[:id])
  end

  def new
    @bathroom = Bathroom.new
  end

  def edit
    @bathroom = Bathroom.find(params[:id])
  end

  def create
    @bathroom = Bathroom.new(params[:bathroom])

    respond_to do |format|
      if @bathroom.save
        format.html { redirect_to(@bathroom) }
        format.js  {
          render :partial => 'member/rooms/room_item', :locals => { :item => @bathroom }
        }
      else
        format.html { render :action => "new" }
        format.js { }
      end
    end
  end

  def update
    @bathroom = Bathroom.find(params[:id])

    respond_to do |format|
      if @bathroom.update_attributes(params[:bathroom])
        flash[:notice] = 'Bathroom was successfully updated.'
        format.html { redirect_to(@bathroom) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @bathroom = Bathroom.find(params[:id])
    @bathroom.destroy

    respond_to do |format|
      format.html { redirect_to(bathrooms_url) }
      format.js { }
    end
  end
end
