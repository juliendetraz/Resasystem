require 'mime/types'

class Member::PicturesController < Member::MemberApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
    @housing = Housing.find params[:housing_id]
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def create
    if params[:Filedata]
      @picture = Picture.new(:picture => params[:Filedata])
      @picture.update_attributes(params[:picture])
      if @picture.save
        render :partial => 'picture.html.erb', :object => @picture
      else
        render :nothing => true, :status => 500
      end
    else
      @picture = Picture.new params[:picture]
      if @picture.save
        redirect_to @picture
      else
        render :action => "new"
      end
    end
  end

  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        flash[:notice] = 'Picture was successfully updated.'
        format.html { redirect_to(@picture) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to(pictures_url) }
      format.xml  { head :ok }
    end
  end

  # Fix the mime types. Make sure to require the mime-types gem
  def swfupload_file=(data)
    data.content_type = MIME::Types.type_for(data.original_filename).to_s
    self.file = data
  end
end
