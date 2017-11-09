Rails.application.routes.draw do
  root 'landing#index' 
  devise_for :users
  
  resources :species
  resources :growth_forms
  resources :profiles
  resources :listings
  
  resources :conversations do
    resources :messages
  end

  resources :charges
  
end
