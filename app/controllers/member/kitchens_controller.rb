class Member::KitchensController < Member::MemberApplicationController
  def index
    @kitchens = Kitchen.all
  end

  def show
    @kitchen = Kitchen.find(params[:id])
  end

  def new
    @kitchen = Kitchen.new
    @rooms = Room.find_all_by_housing_id(params[:housing_id]) if params[:housing_id]
  end

  def edit
    @kitchen = Kitchen.find(params[:id])
  end

  def create
    @kitchen = Kitchen.new(params[:kitchen])
    @room = Room.find(params[:room_id]) if params[:room_id]

    respond_to do |format|
      if @kitchen.save
        format.html { redirect_to(@kitchen) }
        format.js  {
          @kitchen
          @room
          render :partial => 'member/rooms/room_kitchen'
        }
      else
        format.html { render :action => "new" }
        format.js { }
      end
    end
  end

  def update
    @kitchen = Kitchen.find(params[:id])

    respond_to do |format|
      if @kitchen.update_attributes(params[:kitchen])
        flash[:notice] = 'Kitchen was successfully updated.'
        format.html { redirect_to(@kitchen) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @kitchen = Kitchen.find(params[:id])
    @kitchen.destroy

    respond_to do |format|
      format.html { redirect_to(kitchens_url) }
      format.js { }
    end
  end
end
