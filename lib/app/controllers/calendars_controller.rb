class CalendarsController < ApplicationController
  respond_to :json, :html
  # GET /calendars
  # GET /calendars.xml
  def index
    respond_with(@calendars = Calendar.all)
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @calendars }
#    end
  end

  # GET /calendars/1
  # GET /calendars/1.xml
  def show
    respond_with(@calendar = Calendar.find(params[:id]))
=begin
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calendar }
    end
=end
  end

  # GET /calendars/new
  # GET /calendars/new.xml
  def new
    @calendar = Calendar.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calendar }
    end
  end

  # GET /calendars/1/edit
  def edit
    @calendar = Calendar.find(params[:id])
  end

  # POST /calendars
  # POST /calendars.xml
  def create
    @calendar = Calendar.new(params[:calendar])

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to(@calendar, :notice => 'Dummy resource was successfully created.') }
        format.xml  { render :xml => @calendar, :status => :created, :location => @calendar }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calendar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calendars/1
  # PUT /calendars/1.xml
  def update
    @calendar = Calendar.find(params[:id])

    respond_to do |format|
      if @calendar.update_attributes(params[:calendar])
        format.html { redirect_to(@calendar, :notice => 'Dummy resource was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calendar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.xml
  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy

    respond_to do |format|
      format.html { redirect_to(calendars_url) }
      format.xml  { head :ok }
    end
  end
end
