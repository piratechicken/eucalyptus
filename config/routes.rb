Rails.application.routes.draw do
  root 'landing#index' 
  devise_for :users

  resources :profiles
  resources :listings
  resources :species
  resources :growth_forms

end
