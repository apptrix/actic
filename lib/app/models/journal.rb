class Journal < Component
  has_many :components, :as => :parent
  has_many :alarms, :as => :owner
end