class HousingPicturesController < ApplicationController
  # GET /housing_pictures
  # GET /housing_pictures.xml
  def index
    @housing_pictures = HousingPicture.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @housing_pictures }
    end
  end

  # GET /housing_pictures/1
  # GET /housing_pictures/1.xml
  def show
    @housing_picture = HousingPicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @housing_picture }
    end
  end

  # GET /housing_pictures/new
  # GET /housing_pictures/new.xml
  def new
    @housing_picture = HousingPicture.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @housing_picture }
    end
  end

  # GET /housing_pictures/1/edit
  def edit
    @housing_picture = HousingPicture.find(params[:id])
  end

  # POST /housing_pictures
  # POST /housing_pictures.xml
  def create
    @housing_picture = HousingPicture.new(params[:housing_picture])

    respond_to do |format|
      if @housing_picture.save
        flash[:notice] = 'HousingPicture was successfully created.'
        format.html { redirect_to(@housing_picture) }
        format.xml  { render :xml => @housing_picture, :status => :created, :location => @housing_picture }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @housing_picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /housing_pictures/1
  # PUT /housing_pictures/1.xml
  def update
    @housing_picture = HousingPicture.find(params[:id])

    respond_to do |format|
      if @housing_picture.update_attributes(params[:housing_picture])
        flash[:notice] = 'HousingPicture was successfully updated.'
        format.html { redirect_to(@housing_picture) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @housing_picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /housing_pictures/1
  # DELETE /housing_pictures/1.xml
  def destroy
    @housing_picture = HousingPicture.find(params[:id])
    @housing_picture.destroy

    respond_to do |format|
      format.html { redirect_to(housing_pictures_url) }
      format.xml  { head :ok }
    end
  end
end
