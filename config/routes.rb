Rails.application.routes.draw do
  root to: "root#index"
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get "/signup", to: "users#new", as: :signup
  get "/login", to: "sessions#new", as: :login
  delete "/logout", to: "sessions#destroy", as: :logout
end
