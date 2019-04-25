# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  root 'pages#hello'

  get 'locations', to: 'locations#index'
  get 'locations/search', to: 'locations#search'

  patch 'location/:location_id/duties/:id/verify',
        to: 'duties#verify',
        as: :verify_location_duty

  resources :users
  resources :locations do
    resources :payments
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
