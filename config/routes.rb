Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#welcome'
  get '/signin' => 'pages#login'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  
  resources :users, only: [:new, :index, :edit, :update, :destroy]
  get '/profile' => 'users#show'
  resources :characters
end
