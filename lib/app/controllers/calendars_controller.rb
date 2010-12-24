class CalendarsController < ApplicationController
  respond_to :json, :html
  #verify :method => :post, :only => :create

  def index
    respond_with(@calendars = Calendar.all)
  end

  def show
    respond_with(@calendar = Calendar.find(params[:id]))
  end

  def new
    respond_with(@calendar = Calendar.new)
  end

  def edit
    respond_with(@calendar = Calendar.find(params[:id]))
  end

  def create
    respond_with(@calendar = Calendar.create(params[:calendar]))
  end

  def update
    @calendar = Calendar.find(params[:id])
    @calendar.update_attributes(params[:calendar])
    respond_with(@calendar)
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy

    respond_to do |format|
      format.html { redirect_to(calendars_url) }
      format.xml  { head :ok }
    end
  end
end
