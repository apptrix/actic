class EventsController < ApplicationController
  before_filter :get_calendar
    # GET /events/new
  # GET /events/new.xml
  respond_to :json, :html

  def index
    respond_with(@calendar, (@events = @calendar.events.all))
  end

  def show
    respond_with(@calendar, (@event = @calendar.events.find(params[:id])))
  end

  def new
    respond_with(@calendar, (@event = @calendar.events.new))
  end

  def edit
    respond_with(@calendar, (@event = @calendar.events.find(params[:id])))
  end

  def create
    @event = @calendar.events.create(params[:event])
    flash[:notice] = "Event successfully created" if @event.save
    respond_with(@calendar, @event)
  end

  def update
    @event = @calendar.events.find(params[:id])
    @event.update_attributes(params[:calendar])
    respond_with(@calendar, @event)
  end

  def destroy
    @event = @calendar.events.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(calendars_events_url(@calendar, @event)) }
      format.xml  { head :ok }
    end
  end

  private
    def get_calendar
      @calendar = Calendar.find(params[:calendar_id]) unless params[:calendar_id].nil?
    end

end