# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  root 'pages#hello'

  get 'locations', to: 'locations#index'
  get 'locations/search', to: 'locations#search'
  get 'locations/:location_id/due/:id/default', to: 'dues#default',
      as: :default_location_due

  patch 'location/:location_id/duties/:id/verify', to: 'duties#verify',
        as: :verify_location_duty

  post 'locations/:location_id/due/sched', to: 'dues#sched',
       as: :sched_location_due

  resources :users
  resources :locations do
    resources :payments
    resources :duties
    resources :units
    resources :tenants, shallow: true
    resources :contracts
    resources :dues
  end

  get '/login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
