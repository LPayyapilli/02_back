Rails.application.routes.draw do
  # Default root for '/' in this application
  root 'users#index'

  # All post requests for signup and login
  post '/signup' => 'auth#create'
  post '/users' => 'users#create'
  post '/login' => 'auth#login'

  # All requests for pictures
  get 'pictures' => 'pictures#index'
  get 'pictures/:id' => 'pictures#show'
  post 'pictures' => 'pictures#create'
  resources :pictures, only: [:destroy]
end
