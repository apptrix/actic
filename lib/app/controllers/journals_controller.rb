class JournalsController < ApplicationController
  before_filter :get_calendar
  respond_to :json, :html

  def index
    respond_with(@calendar, (@journals = @calendar.journals.all))
  end

  def show
    respond_with(@calendar, (@journal = @calendar.journals.find(params[:id])))
  end

  def new
    respond_with(@calendar, (@journal = @calendar.journals.new))
  end

  def edit
    respond_with(@calendar, (@journal = @calendar.journals.find(params[:id])))
  end

  def create
    @journal = @calendar.journals.create(params[:journal])
    flash[:notice] = "Journal successfully created" if @journal.save
    respond_with(@calendar, @journal)
  end

  def update
    @journal = @calendar.journals.find(params[:id])
    @journal.update_attributes(params[:calendar])
    respond_with(@calendar, @journal)
  end

  def destroy
    @journal = @calendar.journals.find(params[:id])
    @journal.destroy

    respond_to do |format|
      format.html { redirect_to(calendars_journals_url(@calendar, @journal)) }
      format.xml  { head :ok }
    end
  end

  private
    def get_calendar
      @calendar = Calendar.find(params[:calendar_id]) unless params[:calendar_id].nil?
    end

end