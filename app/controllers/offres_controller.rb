class OffresController < ApplicationController
  # GET /offres
  # GET /offres.xml
  def index
    @offres = Offre.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @offres }
    end
  end

  # GET /offres/1
  # GET /offres/1.xml
  def show
    @offre = Offre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @offre }
    end
  end

  # GET /offres/new
  # GET /offres/new.xml
  def new
    @offre = Offre.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @offre }
    end
  end

  # GET /offres/1/edit
  def edit
    @offre = Offre.find(params[:id])
  end

  # POST /offres
  # POST /offres.xml
  def create
    @offre = Offre.new(params[:offre])

    respond_to do |format|
      if @offre.save
        flash[:notice] = 'Offre was successfully created.'
        format.html { redirect_to(@offre) }
        format.xml  { render :xml => @offre, :status => :created, :location => @offre }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @offre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /offres/1
  # PUT /offres/1.xml
  def update
    @offre = Offre.find(params[:id])

    respond_to do |format|
      if @offre.update_attributes(params[:offre])
        flash[:notice] = 'Offre was successfully updated.'
        format.html { redirect_to(@offre) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @offre.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /offres/1
  # DELETE /offres/1.xml
  def destroy
    @offre = Offre.find(params[:id])
    @offre.destroy

    respond_to do |format|
      format.html { redirect_to(offres_url) }
      format.xml  { head :ok }
    end
  end
end
