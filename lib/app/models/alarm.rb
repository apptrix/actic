class Alarm < Component
  belongs_to :component, :polymorphic => true
  #scope :events, where("components.type == 'Event'")
  #has_many :components, :as => :parent

  def owner_type=(sType)
       super(sType.to_s.classify.constantize.base_class.to_s)
  end
end

