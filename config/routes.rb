Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create, :destroy]

  get "login", to: 'sessions#new', as: "login"
end
