Rails.application.routes.draw do
 
  resources :listings
  resources :species
  resources :growth_forms
  devise_for :users
  resources :profiles

end
