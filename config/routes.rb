Rails.application.routes.draw do

  root to: 'landing#index'

  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'users/:id/info', to: 'users#info', as: 'info'

  get '/dashboard', to: 'dashboard#show'

  resources :events, only: [:new, :create, :show]

end
