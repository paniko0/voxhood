Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :episodes
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
