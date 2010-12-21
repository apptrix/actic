class Todo < Component
  belongs_to :calendar
  has_many :alarms, :as => :owner
end

