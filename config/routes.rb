Rails.application.routes.draw do
  resources :messages
  resources :conversations
  root 'landing#index' 
  devise_for :users
  
  resources :species
  resources :profiles
  resources :listings
  resources :growth_forms

end
