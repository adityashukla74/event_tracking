Rails.application.routes.draw do
  resources :locations
  devise_for :users
  resources :events
  root :to => "events#index"
  
  devise_scope :user do 
    match "/users/sign_up", :to => "devise/registrations#new", via: :get
  end 

  match 'events/attend/:id', :to => 'events#attend', :as => :attend
end
