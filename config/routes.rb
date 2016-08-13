Rails.application.routes.draw do
  resources :locations
  devise_for :users
  resources :events
  root :to => "events#index"
  
end
