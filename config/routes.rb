Rails.application.routes.draw do
  resources :cruises, only: [:show, :index]
  resources :users do
    resources :bookings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  root 'sessions#welcome'
  delete '/logout' => 'sessions#destroy'
end
