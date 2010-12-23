class Calendar < Component
  has_many :events, :after_add => :add_component, :after_remove => :reset_component
  has_many :free_busies, :after_add => :add_component, :after_remove => :reset_component
  has_many :journals, :after_add => :add_component,  :after_remove => :reset_component
  has_many :todos, :after_add => :add_component,  :after_remove => :reset_component
  has_many :alarms, :as => :owner, :after_add => :add_component,  :after_remove => :reset_component
  #has_many :components

#  def as_json
#    self.attributes
#  end
  def as_json(options = {})
    r = {
      :guid => "/calendars/#{self.id}",
      :id => self.id,
      :ical => self.ical
    }
    r
  end

end


=begin
class Calendar < Component
  #scope :events, where("components.type == 'Event'")
  has_many :components, :as => :parent, :before_add => :validate_component_type do

  end
  has_many :events, :as => :parent
  has_many :todos, :as => :parent
  has_many :journals, :as => :parent
  has_many :freebusys, :as => :parent

  def validate_component_type(component)
    begin
     component.type != "Calendar" ? true : (raise Exception)
    rescue
    end
  end
end
=end


=begin
@calendar = Calendar.new

@calendar.events

@calendar.events << Event.new
@calendar.todos << Todo.new

=end
