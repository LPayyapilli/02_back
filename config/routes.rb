Rails.application.routes.draw do
  # Default root for '/' in this application
  root 'users#index'
  # these routes are for showing users a login form, logging them in, and logging them out.
  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  post '/login' => 'auth#login'
  post '/signup'=> 'auth#create'
  # create routes for users resource
  # resources :users, except: [:new, :edit] do
  #   # create nested routes for the users pictures
  #   resources :pictures, except: [:new, :edit]
end
