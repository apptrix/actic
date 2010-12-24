Rails.application.routes.draw do #|map|
   resources :calendars do
     resources :events
   end
end