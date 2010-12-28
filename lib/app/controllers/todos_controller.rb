class TodosController < ApplicationController
  before_filter :get_calendar
  respond_to :json, :html

  def index
    respond_with(@calendar, (@todos = @calendar.todos.all))
  end

  def show
    respond_with(@calendar, (@todo = @calendar.todos.find(params[:id])))
  end

  def new
    respond_with(@calendar, (@todo = @calendar.todos.new))
  end

  def edit
    respond_with(@calendar, (@todo = @calendar.todos.find(params[:id])))
  end

  def create
    @todo = @calendar.todos.create(params[:todo])
    flash[:notice] = "Todo successfully created" if @todo.save
    respond_with(@calendar, @todo)
  end

  def update
    @todo = @calendar.todos.find(params[:id])
    @todo.update_attributes(params[:calendar])
    respond_with(@calendar, @todo)
  end

  def destroy
    @todo = @calendar.todos.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to(calendars_todos_url(@calendar, @todo)) }
      format.xml  { head :ok }
    end
  end

  private
    def get_calendar
      @calendar = Calendar.find(params[:calendar_id]) unless params[:calendar_id].nil?
    end

end