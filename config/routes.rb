Rails.application.routes.draw do
  root to: "events#index"

  devise_for :users
  resources :users, :only => [:show]
  resources :events
  
  resources :events do
    resources :orders
  end
  

  #resources :orders, only: [:new, :create]
  




  # get 'users/sign_out', to: 'devise/sessions/users#destroy'

  
  #get 'devise/registrations/new', to: 'devices/registrations#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
