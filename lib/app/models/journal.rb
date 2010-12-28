class Journal < Component
  belongs_to :calendar
  has_many :components, :as => :parent
  has_many :alarms, :as => :owner
end