Rails.application.routes.draw do
  get 'sessions/new'
  root 'pages#hello'
  get 'pages/hi'
  resources :users
  resources :locations
  get '/login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
