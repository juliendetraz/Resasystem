class Member::BedroomsController < Member::MemberApplicationController
  def index
    @bedrooms = Bedroom.all
  end

  def show
    @bedroom = Bedroom.find(params[:id])
  end

  def new
    @bedroom = Bedroom.new
  end

  def edit
    @bedroom = Bedroom.find(params[:id])
  end

  def create
    @bedroom = Bedroom.new(params[:bedroom])
    @room = Room.find(params[:room_id]) if params[:room_id]

    respond_to do |format|
      if @bedroom.save
        format.html { redirect_to(@bedroom) }
        format.js  {
          @bedroom
          @room
          render :partial => 'member/rooms/room_bedroom'
        }
      else
        format.html { render :action => "new" }
        format.js { }
      end
    end
  end

  def update
    @bedroom = Bedroom.find(params[:id])

    respond_to do |format|
      if @bedroom.update_attributes(params[:bedroom])
        flash[:notice] = 'Bedroom was successfully updated.'
        format.html { redirect_to(@bedroom) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @bedroom = Bedroom.find(params[:id])
    @bedroom.destroy

    respond_to do |format|
      format.html { redirect_to(bedrooms_url) }
      format.js { }
    end
  end
end
