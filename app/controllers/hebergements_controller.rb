class HebergementsController < ApplicationController
  # GET /hebergements
  # GET /hebergements.xml
  def index
    @hebergements = Hebergement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hebergements }
    end
  end

  # GET /hebergements/1
  # GET /hebergements/1.xml
  def show
    @hebergement = Hebergement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hebergement }
    end
  end

  # GET /hebergements/new
  # GET /hebergements/new.xml
  def new
    @hebergement = Hebergement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hebergement }
    end
  end

  # GET /hebergements/1/edit
  def edit
    @hebergement = Hebergement.find(params[:id])
  end

  # POST /hebergements
  # POST /hebergements.xml
  def create
    @hebergement = Hebergement.new(params[:hebergement])

    respond_to do |format|
      if @hebergement.save
        flash[:notice] = 'Hebergement was successfully created.'
        format.html { redirect_to(@hebergement) }
        format.xml  { render :xml => @hebergement, :status => :created, :location => @hebergement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hebergement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hebergements/1
  # PUT /hebergements/1.xml
  def update
    @hebergement = Hebergement.find(params[:id])

    respond_to do |format|
      if @hebergement.update_attributes(params[:hebergement])
        flash[:notice] = 'Hebergement was successfully updated.'
        format.html { redirect_to(@hebergement) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hebergement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hebergements/1
  # DELETE /hebergements/1.xml
  def destroy
    @hebergement = Hebergement.find(params[:id])
    @hebergement.destroy

    respond_to do |format|
      format.html { redirect_to(hebergements_url) }
      format.xml  { head :ok }
    end
  end
end
