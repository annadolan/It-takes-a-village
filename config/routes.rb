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

  resources :events do
    get :get_tasks, on: :collection
  end

  resources :events_tasks
  # get '/events_tasks/:id/edit', to: 'events_tasks#edit', as: :edit_event_task_path
  # post '/events_tasks', to: 'events_tasks#update'

  get '/:user', to: 'users#show', as: 'show_user'

end
