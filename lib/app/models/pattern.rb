class Pattern < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true

  def owner_type=(stype)
       super(stype.to_s.classify.constantize.base_class.to_s)
  end
end