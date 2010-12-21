class FreeBusy < Component
  has_many :components, :as => :parent
end