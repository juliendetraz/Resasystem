class Member::RoomsController < Member::MemberApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
    @rooms = Room.find_all_by_housing_id(params[:housing_id]) if params[:housing_id]
  end

  def edit
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(params[:room])
    
    respond_to do |format|
      if @room.save
        format.html { redirect_to(@room) }
        format.js   { @room }
      else
        format.html { render :action => "new" }
        format.js   { }
      end
    end
  end

  def update
    @room = Room.find(params[:id])

    respond_to do |format|
      if @room.update_attributes(params[:room])
        flash[:notice] = 'Room was successfully updated.'
        format.html { redirect_to(@room) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { redirect_to(get_module_url("%_housing_rooms", @room.housing)) }
      format.js {
        @rooms = Room.find_all_by_housing_id(@room.housing)
      }
    end
  end
end
