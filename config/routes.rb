Rails.application.routes.draw do
  get 'notification/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # index, show, new, create, edit, update, destroy
  resources :rooms, only: %i[index show]
  resources :messages, only: %i[index create]
  resources :users, only: %i[index create show update]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#show'
  get '/connected', to: 'users#connected'
  get '/disconnected', to: 'users#disconnected'
  mount ActionCable.server => '/cable'
end
