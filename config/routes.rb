Rails.application.routes.draw do
  root 'landing#index' 
  devise_for :users
  
  resources :species
  resources :growth_forms, only: [:index, :show]
  resources :profiles
  resources :listings
  
  resources :conversations do
    resources :messages
  end

  get '/support' => 'support#new'
  post '/support' => 'support#create'

  resources :charges
  
end
