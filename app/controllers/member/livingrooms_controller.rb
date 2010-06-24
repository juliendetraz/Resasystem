class Member::LivingroomsController < Member::MemberApplicationController
  def index
    @livingrooms = Livingroom.all
  end

  def show
    @livingroom = Livingroom.find(params[:id])
  end

  def new
    @livingroom = Livingroom.new
  end

  def edit
    @livingroom = Livingroom.find(params[:id])
  end

  def create
    @livingroom = Livingroom.new(params[:livingroom])

    respond_to do |format|
      if @livingroom.save
        format.html { redirect_to(@livingroom) }
        format.js  {
          render :partial => 'member/rooms/room_item', :locals => { :item => @livingroom }
        }
      else
        format.html { render :action => "new" }
        format.js   { }
      end
    end
  end

  def update
    @livingroom = Livingroom.find(params[:id])

    respond_to do |format|
      if @livingroom.update_attributes(params[:livingroom])
        format.html { redirect_to(@livingroom) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @livingroom = Livingroom.find(params[:id])
    @livingroom.destroy

    respond_to do |format|
      format.html { redirect_to(livingrooms_url) }
      format.js   { }
    end
  end
end
