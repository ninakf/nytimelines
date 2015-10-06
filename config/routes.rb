Rails.application.routes.draw do
    root to: "timelines#welcome" 
    resources :timelines 
end
