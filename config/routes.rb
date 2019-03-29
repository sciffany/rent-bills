# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  root 'pages#hello'
  resources :users
  resources :locations do
    resources :duties
    resources :units
    resources :tenants, shallow: true do
      resources :contracts, shallow: true
    end
  end
  get '/login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
