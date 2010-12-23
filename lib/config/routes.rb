Rails.application.routes.draw do #|map|
   resources :calendars do
     resources :events#, :controller => "Calendars::Events"
   end#, :controller => '../app/controllers/calendars'#, :only => [:new, :create]
end