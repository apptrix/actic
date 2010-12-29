# Experimental
#=begin
class AlarmsController < ApplicationController
  before_filter :get_base_model
  respond_to :json, :html

  def index
    @alarms = @base_model.alarms.all
    respond_with(polymorphic_url(@base_model.class))
  end

  def show
    respond_with(polymorphic_url([@base_model, (@alarm = @base_model.alarms.find(params[:id]))]))
  end

  def new
    respond_with(polymorphic_url([@base_model, (@alarm = @base_model.alarms.new)]))
  end

  def edit
    respond_with(polymorphic_url([@base_model, (@alarm = @base_model.alarms.find(params[:id]))]))
  end

  def create
    @alarm = @base_model.alarms.create(params[:alarm])
    flash[:notice] = "Alarm successfully created" if @alarm.save
    respond_with([@base_model, @alarm])
  end

  def update
    @alarm = @base_model.alarms.find(params[:id])
    @alarm.update_attributes(params[:base_model])
    respond_with(polymorphic_url([@base_model, @alarm]))
  end

  def destroy
    @alarm = @base_model.alarms.find(params[:id])
    @alarm.destroy

    respond_to do |format|
      format.html { redirect_to([@base_model, @alarm]) }
      format.xml  { head :ok }
    end
  end

  private

  def get_base_model
  [['calendar_id', Calendar], ['event_id', Event]].each { |c|
    if params.keys.include?(c[0])
      @base_model = c[1].find(params[c[0]])
      break
    end
  }
  end
end
#=end