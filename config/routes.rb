Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create, :destroy]
  
  root to: 'home#welcome'
  get "login", to: 'sessions#new', as: "login"
end
