class ActicCalendar < ActiveRecord::Base
  include Actic::Calendar
  has_many :subcomponents

  def responds_to_actical?
    true
  end
end
