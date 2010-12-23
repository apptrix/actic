class EventsController < ApplicationController
  before_filter :get_calendar
    # GET /events/new
  # GET /events/new.xml
  def new
    #@event = @calendar.events.new

  #  respond_to do |format|
  #   format.html # new.html.erb
  #    format.xml  { render :xml => @event }
  #  end
  end

  def index

  end

  private
    def get_calendar
      @calendar = Calendar.find(params[:calendar_id]) unless params[:calendar_id].nil?
    end
# GET /calendars
  # GET /calendars.xml
=begin
  before_filter :get_calendar

  def index
    @events = @calendar.events.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = @calendar.events.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = @calendar.events.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = @calendar.events.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to([@calendar,@event], :notice => 'Dummy resource was successfully created.') }
        format.xml  { render :xml => [@calendar,@event], :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = @calendar.events.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Dummy resource was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = @calendar.events.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
  
  private
    def get_calendar
      @calendar = Calendar.find(params[:event_id]) unless params[:event_id].nil?
    end  
=end
end