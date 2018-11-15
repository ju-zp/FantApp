Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#welcome'
  mount ActionCable.server => '/cable'
  
  get '/signin' => 'pages#login'
  get '/you-shall-not-pass' => 'pages#pass'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  
  resources :users, only: [:new, :index, :edit, :update, :destroy]
  resources :chatrooms
  resources :messages
  get '/profile' => 'users#show'
  resources :characters
  resources :comments, only: [:create, :destroy]
end
