class ActicCalendar < ActiveRecord::Base
  include Actic::Calendar
  has_many :sub_components

  def responds_to_actical?
    true
  end
end
