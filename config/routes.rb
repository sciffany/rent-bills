Rails.application.routes.draw do
  root 'pages#hello'
  get 'pages/hi'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
