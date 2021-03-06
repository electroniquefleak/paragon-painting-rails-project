Rails.application.routes.draw do
  resources :projects do
    resources :roles, except: [:show]
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create, :destroy]
  
  root to: 'home#welcome'
  get "registration", to: "users#new", as: "registration"
  get "login", to: 'sessions#new', as: "login"
  get "logout", to: 'sessions#destroy', as: "logout"
  get 'dashboards/dashboard', to: 'dashboards#dashboard', as: "dashboard"
  get '/auth/:provider/callback' => 'sessions#omniauth'
end
