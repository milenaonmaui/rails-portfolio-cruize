Rails.application.routes.draw do
  resources :cruises, only: [:show, :index] do
    resources :bookings, only: [:new]
  end
  resources :users, only: [:new, :create, :show]
  resources :bookings
  
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  root 'sessions#welcome'
  delete '/logout' => 'sessions#destroy'
end
