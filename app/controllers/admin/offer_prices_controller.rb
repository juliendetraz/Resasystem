class Admin::OfferPricesController < Admin::AdminApplicationController
  # GET /offer_prices
  # GET /offer_prices.xml
  def index
    @offer_prices = OfferPrice.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @offer_prices }
    end
  end

  # GET /offer_prices/1
  # GET /offer_prices/1.xml
  def show
    @offer_price = OfferPrice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @offer_price }
    end
  end

  # GET /offer_prices/new
  # GET /offer_prices/new.xml
  def new
    @offer_price = OfferPrice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @offer_price }
    end
  end

  # GET /offer_prices/1/edit
  def edit
    @offer_price = OfferPrice.find(params[:id])
  end

  # POST /offer_prices
  # POST /offer_prices.xml
  def create
    @offer_price = OfferPrice.new(params[:offer_price])

    respond_to do |format|
      if @offer_price.save
        flash[:notice] = 'OfferPrice was successfully created.'
        format.html { redirect_to(@offer_price) }
        format.xml  { render :xml => @offer_price, :status => :created, :location => @offer_price }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @offer_price.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /offer_prices/1
  # PUT /offer_prices/1.xml
  def update
    @offer_price = OfferPrice.find(params[:id])

    respond_to do |format|
      if @offer_price.update_attributes(params[:offer_price])
        flash[:notice] = 'OfferPrice was successfully updated.'
        format.html { redirect_to(@offer_price) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @offer_price.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /offer_prices/1
  # DELETE /offer_prices/1.xml
  def destroy
    @offer_price = OfferPrice.find(params[:id])
    @offer_price.destroy

    respond_to do |format|
      format.html { redirect_to(offer_prices_url) }
      format.xml  { head :ok }
    end
  end
end
