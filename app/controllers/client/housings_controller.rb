class Client::HousingsController < Client::ClientApplicationController
  # GET /housings
  # GET /housings.xml
  def index
    @housings = Housing.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @housings }
    end
  end

  # GET /housings/1
  # GET /housings/1.xml
  def show
    @housing = Housing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @housing }
    end
  end

  # GET /housings/new
  # GET /housings/new.xml
  def new
    @housing = Housing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @housing }
    end
  end

  # GET /housings/1/edit
  def edit
    @housing = Housing.find(params[:id])
  end

  # POST /housings
  # POST /housings.xml
  def create
    @housing = Housing.new(params[:housing])

    respond_to do |format|
      if @housing.save
        flash[:notice] = 'Housing was successfully created.'
        format.html { redirect_to(@housing) }
        format.xml  { render :xml => @housing, :status => :created, :location => @housing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @housing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /housings/1
  # PUT /housings/1.xml
  def update
    @housing = Housing.find(params[:id])

    respond_to do |format|
      if @housing.update_attributes(params[:housing])
        flash[:notice] = 'Housing was successfully updated.'
        format.html { redirect_to(@housing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @housing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /housings/1
  # DELETE /housings/1.xml
  def destroy
    @housing = Housing.find(params[:id])
    @housing.destroy

    respond_to do |format|
      format.html { redirect_to(housings_url) }
      format.xml  { head :ok }
    end
  end

  def search
    respond_to do |format|
      format.html {  }
      format.json {
        @housings = Housing.includes(:address).where(get_search_where_condition)
      }
    end
  end

  def get_search_where_condition
    param_hash = {
      :housing_id => '`housings`.`id` = ?',
      :user_id => '`housings`.`user_id` = ?',
      :city => "`addresses`.`city` LIKE ?",
      :location => "`addresses`.`city` LIKE ? OR `addresses`.`state_province_country` LIKE ?"
    }
    condition_string = Array.new
    condition_params = Array.new
    param_hash.each_pair {|k,v|
      if params[k]
        condition_string << v
        condition_params << Array.new(v.count('?'), params[k])
      end
    }
    return nil if condition_string.empty?
    condition_params.flatten(1).insert(0, condition_string.join(" AND "))
  end
end
