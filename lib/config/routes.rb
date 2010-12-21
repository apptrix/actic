Rails.application.routes.draw do |map|
   resources :calendars#, :controller => '../app/controllers/calendars'#, :only => [:new, :create]
end