Rails.application.routes.draw do
  resources :podcasts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#profile"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/profile' => 'users#profile'
  get '/signup' => 'users#new'
  get '/forgot' => 'users#forgot'
  post '/users' => 'users#create'
end
