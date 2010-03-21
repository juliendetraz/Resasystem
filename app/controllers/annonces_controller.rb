class AnnoncesController < ApplicationController
  # GET /annonces
  # GET /annonces.xml
  def index
    @annonces = Annonce.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @annonces }
    end
  end

  # GET /annonces/1
  # GET /annonces/1.xml
  def show
    @annonce = Annonce.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @annonce }
    end
  end

  # GET /annonces/new
  # GET /annonces/new.xml
  def new
    @annonce = Annonce.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @annonce }
    end
  end

  # GET /annonces/1/edit
  def edit
    @annonce = Annonce.find(params[:id])
  end

  # POST /annonces
  # POST /annonces.xml
  def create
    @annonce = Annonce.new(params[:annonce])

    respond_to do |format|
      if @annonce.save
        flash[:notice] = 'Annonce was successfully created.'
        format.html { redirect_to(@annonce) }
        format.xml  { render :xml => @annonce, :status => :created, :location => @annonce }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @annonce.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /annonces/1
  # PUT /annonces/1.xml
  def update
    @annonce = Annonce.find(params[:id])

    respond_to do |format|
      if @annonce.update_attributes(params[:annonce])
        flash[:notice] = 'Annonce was successfully updated.'
        format.html { redirect_to(@annonce) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @annonce.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /annonces/1
  # DELETE /annonces/1.xml
  def destroy
    @annonce = Annonce.find(params[:id])
    @annonce.destroy

    respond_to do |format|
      format.html { redirect_to(annonces_url) }
      format.xml  { head :ok }
    end
  end
end
