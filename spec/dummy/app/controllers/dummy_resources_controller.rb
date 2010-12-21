class DummyResourcesController < ApplicationController
  # GET /dummy_resources
  # GET /dummy_resources.xml
  def index
    @dummy_resources = DummyResource.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dummy_resources }
    end
  end

  # GET /dummy_resources/1
  # GET /dummy_resources/1.xml
  def show
    @dummy_resource = DummyResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dummy_resource }
    end
  end

  # GET /dummy_resources/new
  # GET /dummy_resources/new.xml
  def new
    @dummy_resource = DummyResource.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dummy_resource }
    end
  end

  # GET /dummy_resources/1/edit
  def edit
    @dummy_resource = DummyResource.find(params[:id])
  end

  # POST /dummy_resources
  # POST /dummy_resources.xml
  def create
    @dummy_resource = DummyResource.new(params[:dummy_resource])

    respond_to do |format|
      if @dummy_resource.save
        format.html { redirect_to(@dummy_resource, :notice => 'Dummy resource was successfully created.') }
        format.xml  { render :xml => @dummy_resource, :status => :created, :location => @dummy_resource }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dummy_resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dummy_resources/1
  # PUT /dummy_resources/1.xml
  def update
    @dummy_resource = DummyResource.find(params[:id])

    respond_to do |format|
      if @dummy_resource.update_attributes(params[:dummy_resource])
        format.html { redirect_to(@dummy_resource, :notice => 'Dummy resource was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dummy_resource.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dummy_resources/1
  # DELETE /dummy_resources/1.xml
  def destroy
    @dummy_resource = DummyResource.find(params[:id])
    @dummy_resource.destroy

    respond_to do |format|
      format.html { redirect_to(dummy_resources_url) }
      format.xml  { head :ok }
    end
  end
end
