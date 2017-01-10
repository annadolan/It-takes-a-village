Rails.application.routes.draw do

  root to: 'landing#index'

  resources :users

  get '/confirm' => 'confirmations#new', as: :user_confirmation
  post '/confirm' => 'confirmations#edit'
  patch '/confirm' => 'confirmations#update', as: :user_confirm_update

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'users/:id/info', to: 'users#info', as: 'info'

  get '/dashboard', to: 'dashboard#show'

  resources :events

  get '/:user', to: 'users#show', as: 'show_user'

end
