Rails.application.routes.draw do
  resources :locations
  devise_for :users
  resources :events
  root :to => "events#index"
  
  devise_scope :user do 
    get "/users/sign_up", :to => "devise/registrations#new", via: :all
  end 

  get 'events/attend/:id', :to => 'events#attend', :as => :attend
end
